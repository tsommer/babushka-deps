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
