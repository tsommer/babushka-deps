dep "postgres-setup-db", :db_name, :db_username do
  met? {
    result = sudo %Q{psql -c "SELECT rolname FROM pg_roles WHERE rolname = '#{db_username}'"}, :as => 'postgres'
    result =~ /1 row/
  }

  meet {
    sudo "createuser -R -D -A -P #{db_username}", :as => 'postgres'
    sudo "createdb -O #{db_username} #{db_name}", :as => 'postgres'
    puts "Database '#{db_name}' created. User: '#{db_username}'"
  }
end
