dep "ubuntu-core" do
  requires "benhoskings:system",
           "build-essential",
           "ack",
           "zip",
           "unzip"
end

dep "ubuntu" do
  requires "ubuntu-core"
  requires "libxml2-dev.managed",
           "libxslt-dev.managed",
           "libcurl4-openssl-dev.managed"
end

dep "ubuntu-mysql" do
  requires "ubuntu"

  requires "benhoskings:mysql.managed"
end

dep "ubuntu-postgres" do
  requires "ubuntu"

  requires "benhoskings:postgres.managed"
end

dep "ubuntu-java" do
  requires "ubuntu-mysql"

  requires "openjdk-6-jdk.managed"
end

dep "set mysql root password", :new_password do
  raw_shell "mysqladmin -u root -p password #{new_password}"
end

dep "install and use ruby with rvm", :version do
  raw_shell "rvm install #{version} && rvm use #{version} --default"
end

