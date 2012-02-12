dep "setup-rails-app", :domain, :domain_aliases, :username, :path, :listen_host, :listen_port, :env, :nginx_prefix, :enable_ssl, :force_ssl, :data_required do
  requires "benhoskings:rails app".with(domain, domain_aliases, username, path, listen_host, listen_port, env, nginx_prefix, enable_ssl, force_ssl, data_required),
           "tsommer:setup-ssl-vhost".with(domain, path, listen_host, listen_port, nginx_prefix)
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
