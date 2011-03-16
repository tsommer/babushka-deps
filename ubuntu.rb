dep "ubuntu" do
  requires "libxml2-dev.managed",
           "libxslt2-dev.managed",
           "libssl-dev.managed",
           "libopenssl-ruby.managed",
           "rvm"

  requires "benhoskings:mysql.managed"
end
