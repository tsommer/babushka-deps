dep "ubuntu" do
  requires "libxml2-dev.managed",
           "libxslt-dev.managed",
           "libssl-dev.managed",
           "libopenssl-ruby.managed",
           "libcurl4-openssl-dev.managed",
           "libreadline5.managed",
           "rvm"

  requires "benhoskings:mysql.managed"
end
