dep "jasper" do
  requires "ubuntu-mysql"

  requires "sphinx.src",
           "imagemagick.managed"
end

dep "radiopaedia" do
  requires "ubuntu-mysql"

  requires "sphinx.src",
           "libfreeimage-dev.managed"
end

dep "jasperdocs" do
  requires "ubuntu-java"

  requires "sphinx.src",
           "libmagick9-dev.managed",
           "redis-server",
           "firefox",
           "xvfb.managed"
end

dep "wildiaries" do
  requires "ubuntu-mysql"

  requires "libmagick9-dev.managed"
end

dep "cafeconcierge" do
  requires "ubuntu-postgres"

  requires "libsasl2-dev.managed",
           "libmemcached-dev.managed",
           "libpq-dev.managed"
end

dep "cafeconcierge-production" do
  requires "cafeconcierge",
           "postfix",
           "postgres-setup-db"
end

dep "dma" do
  requires "ubuntu-java"

  requires "firefox",
           "xvfb.managed"
end

dep "smash-reports" do
  requires "ubuntu-mysql"

  requires "libyaml-dev.managed"
end

dep "shotsnanigans" do
  requires "ubuntu-postgres"
end

dep "yourview" do
  requires "ubuntu-postgres"

  requires "libsasl2-dev.managed",
           "libpq-dev.managed",
           "sqlite"
end

