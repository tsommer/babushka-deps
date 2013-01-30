dep "setup app", :new_password, :version, :app_name, :number_of_test_dbs do
  requires "set mysql root password".with(new_password),
           "install and use ruby with rvm".with(version),
           "bundle app",
           "create app dbs".with(app_name, number_of_test_dbs, new_password)
end

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

  requires "setup app"
end

dep "imagehaus" do
  requires "ubuntu-mysql"

  requires "graphicsmagick-libmagick-dev-compat.managed",
           "libmagickwand-dev.managed"

  requires "setup app"
end

