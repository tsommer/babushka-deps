dep "ubuntu-core" do
  requires "benhoskings:system",
           "build-essential",
           "ack"
end

dep "ubuntu" do
  requires "ubuntu-core"
  requires "libxml2-dev.managed",
           "libxslt-dev.managed",
           "libssl-dev.managed",
           "libcurl4-openssl-dev.managed",
           "libreadline5-dev.managed",
           "libreadline6-dev.managed"
end

dep "ubuntu-mysql" do
  requires "ubuntu"

  requires "benhoskings:mysql.managed"
end

dep "ubuntu-postgres" do
  requires "ubuntu"

  requires "benhoskings:postgres.managed",
           "postgres-setup-db"
end

dep "ubuntu-java" do
  requires "ubuntu-mysql"

  requires "openjdk-6-jdk.managed"
end
