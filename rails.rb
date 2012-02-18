dep "setup-rails-app", :domain, :domain_aliases, :username, :path, :listen_host, :listen_port, :env, :nginx_prefix, :enable_ssl, :force_ssl, :data_required do
  requires "benhoskings:rails app".with(domain, domain_aliases, username, path, listen_host, listen_port, env, nginx_prefix, enable_ssl, force_ssl, data_required),
           "setup-ssl-vhost.nginx".with(domain, path, listen_host, listen_port, nginx_prefix)
end

dep "regenerate-assets", :root, :env do
  met? { @run }

  meet {
    cd(root) {
      shell "bundle exec rake assets:clear_cache RAILS_ENV=#{env}"
      shell "bundle exec rake assets:precompile RAILS_ENV=#{env}"
    }

    @run = true
  }
end

dep "restart-delayed-job", :root, :env do
  met? {
    cd(root) {
      pid = "tmp/pids/delayed_job.pid".p.read
      @old_pid && !pid.blank? && pid != @old_pid
    }
  }

  meet {
    cd(root) {
      @old_pid = "tmp/pids/delayed_job.pid".p.read

      log_shell "Restarting delayed job",
        "/usr/bin/env RAILS_ENV=#{env} bundle exec script/delayed_job restart"
    }
  }
end

dep "update-crontab", :root, :env do
  met? { @run }

  meet {
    cd(root) {
      shell "bundle exec whenever -w -s 'environment=#{env}'"
    }
  }
end

