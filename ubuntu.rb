dep "ubuntu" do
  requires "libxml2-dev.managed",
           "libxslt-dev.managed",
           "libssl-dev.managed",
           "libopenssl-ruby.managed",
           "libcurl4-openssl-dev.managed",
           "libreadline5-dev.managed",
           "libreadline6-dev.managed",
           "rvm"
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
