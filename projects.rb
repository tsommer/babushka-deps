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

dep "redbubble" do
  requires "ubuntu-java"

  requires "libgeoip-dev.managed",
           "graphicsmagick-libmagick-dev-compat.managed",
           "libmagickwand-dev.managed",
           "rabbitmq-server.managed"

  log_shell "Set mysql root password",
    "mysql_secure_installation"
end

