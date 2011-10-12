dep "ubuntu" do
  requires "libxml2-dev.managed",
           "libxslt-dev.managed",
           "libssl-dev.managed",
           "libopenssl-ruby.managed",
           "libcurl4-openssl-dev.managed",
           "libreadline5-dev.managed",
           "libreadline6-dev.managed",
           "rvm"

  requires "benhoskings:mysql.managed"
end

dep "ubuntu-java" do
  requires "ubuntu"

  requires "openjdk-6-jdk.managed"
end
