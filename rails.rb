dep "setup-rails-app", :domain, :domain_aliases, :username, :path, :listen_host, :listen_port, :proxy_host, :proxy_port, :env, :nginx_prefix, :enable_http, :enable_https, :force_https, :data_required do
  requires "benhoskings:rails app".with(domain, domain_aliases, username, path, listen_host, listen_port, proxy_host, proxy_port, env, nginx_prefix, enable_http, enable_https, force_https, data_required),
           "setup-ssl-vhost.nginx".with(domain, path, listen_host, listen_port, nginx_prefix),
           "rails-app.logrotate".with(username)
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
  run {
    shell "bluepill #{username}-delayed_job quit --no-privileged"
    shell "bluepill #{username}-unicorn quit --no-privileged"
  }
end

dep "start-bluepill.task", :username, :env do
  requires "delayed_job.bluepill".with(username, env),
           "unicorn.bluepill".with(username, env)

  run {
    shell "bluepill load ~/pills/delayed_job.pill --no-privileged"
    shell "bluepill load ~/pills/unicorn.pill --no-privileged"
  }
end

