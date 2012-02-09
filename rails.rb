dep "regenerate-assets", :env do
  met? { @run }

  meet {
    shell "RAILS_ENV=#{env} bundle exec rake assets:clear_cache"
    shell "RAILS_ENV=#{env} bundle exec rake assets:precompile"
  }
end
