dep "postgres-setup-db", :db_name, :username do
  met? {
    result = sudo %Q{psql -c "SELECT rolname FROM pg_roles WHERE rolname = '#{username}'"}, :as => 'postgres'
    result =~ /1 row/
  }

  meet {
    sudo "createuser -R -D -A -P #{username}", :as => 'postgres'
    sudo "createdb -O #{username} #{db_name}", :as => 'postgres'
    puts "Database '#{db_name}' created. User: '#{username}'"
  }
end
