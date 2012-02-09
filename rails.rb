dep "regenerate-assets", :root, :env do
  met? { @run }

  meet {
    cd(root) {
      shell "RAILS_ENV=#{env} bundle exec rake assets:clear_cache"
      shell "RAILS_ENV=#{env} bundle exec rake assets:precompile"
    }
  }
end
