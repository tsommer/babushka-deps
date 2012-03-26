dep "setup-rails-app", :domain, :domain_aliases, :username, :path, :listen_host, :listen_port, :proxy_host, :proxy_port, :env, :nginx_prefix, :enable_http, :enable_https, :force_https, :data_required do
  requires "benhoskings:rails app".with(domain, domain_aliases, username, path, listen_host, listen_port, proxy_host, proxy_port, env, nginx_prefix, enable_http, enable_https, force_https, data_required),
           "setup-ssl-vhost.nginx".with(domain, path, listen_host, listen_port, nginx_prefix),
           "rails-app.logrotate".with(username),
           "setup-bluepill"
end

dep "migrate-db.task", :root, :env do
  run {
    cd(root) {
      shell "bundle exec rake db:migrate RAILS_ENV=#{env}"
    }
  }
end

dep "regenerate-assets.task", :root, :env do
  run {
    cd(root) {
      shell "bundle exec rake assets:clear_cache RAILS_ENV=#{env}"
      shell "bundle exec rake assets:precompile RAILS_ENV=#{env}"
    }
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

dep "update-crontab.task", :root, :env do
  run {
    cd(root) {
      shell "bundle exec whenever -w -s 'environment=#{env}'"
    }
  }
end

dep "stop-bluepill.task", :username do
  username.default!(shell('whoami'))

  run {
    Dir[File.join(File.expand_path("~/pills"), "*.pill")].each do |path|
      shell "bluepill #{username}-#{File.basename(path, ".pill")} quit --no-privileged"
    end
  }
end

dep "start-bluepill.task" do
  run {
    Dir[File.join(File.expand_path("~/pills"), "*.pill")].each do |path|
      shell "bluepill load #{path} --no-privileged"
    end
  }
end

