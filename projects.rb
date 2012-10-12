dep "cafeconcierge" do
  requires "ubuntu-mysql"

  requires "libsasl2-dev.managed",
           "libmemcached-dev.managed",
           "redis-server.managed"
end

dep "cafeconcierge-production" do
  requires "cafeconcierge",
           "benhoskings:mysql access"
end

