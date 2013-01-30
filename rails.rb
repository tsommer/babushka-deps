dep "setup-rails-app", :domain, :domain_aliases, :username, :path, :listen_host, :listen_port, :proxy_host, :proxy_port, :env, :nginx_prefix, :enable_http, :enable_https, :force_https, :data_required do
  requires "benhoskings:rails app".with(domain, domain_aliases, username, path, listen_host, listen_port, proxy_host, proxy_port, env, nginx_prefix, enable_http, enable_https, force_https, data_required),
           "setup-ssl-vhost.nginx".with(domain, path, listen_host, listen_port, nginx_prefix),
           "rails-app.logrotate".with(username),
           "setup-bluepill".with(username),
           "delayed_job.bluepill".with(username, env),
           "unicorn.bluepill".with(username, env)
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
      shell "bundle exec rake assets:precompile RAILS_ENV=#{env}"
    }
  }
end

dep "expire-all-fragments.task", :root, :env do
  run {
    cd(root) {
      shell "bundle exec rake cleanup:expire_fragments RAILS_ENV=#{env}"
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
    Dir[File.join(File.expand_path("~#{username}/pills"), "*.pill")].each do |path|
      shell "bluepill #{username}-#{File.basename(path, ".pill")} quit --no-privileged"
    end
  }
end

dep "start-bluepill.task", :username do
  username.default!(shell('whoami'))

  run {
    Dir[File.join(File.expand_path("~#{username}/pills"), "*.pill")].each do |path|
      shell "bluepill load #{path} --no-privileged"
    end
  }
end

dep "bundle app" do
  shell "bundle"
end

dep "create app dbs", :app_name, :number_of_test_dbs, :new_password do
  create_db = "CREATE DATABASE IF NOT EXISTS"

  log_shell "Create development DB",
    "mysql -u root --password=#{new_password} -e '#{create_db} #{app_name}_development'"

  "#{number_of_test_dbs}".to_i.times do |i|
    index           = i + 1
    index_to_append = (index == 1 ? "" : index.to_s)

    log_shell "Create test DB #{index}",
      "mysql -u root --password=#{new_password} -e '#{create_db} #{app_name}_test#{index_to_append}'"
    log_shell "Create cucumber DB #{index}",
      "mysql -u root --password=#{new_password} -e '#{create_db} #{app_name}_cucumber#{index_to_append}'"
  end
end

