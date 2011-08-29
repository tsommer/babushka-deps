dep "jasper" do
  requires "ubuntu"

  requires "sphinx.src",
           "imagemagick.managed"
end

dep "radiopaedia" do
  requires "ubuntu"

  requires "sphinx.src",
           "libfreeimage-dev.managed"
end

dep "jasperdocs" do
  requires "ubuntu-java"

  requires "sphinx.src",
           "libmagick9-dev.managed",
           "redis-server",
           "coffeescript.src"
end

dep "wildiaries" do
  requires "ubuntu"

  requires "libmagick9-dev.managed"
end

dep "cafeconcierge" do
  requires "ubuntu"

  requires "libsasl2-dev.managed",
           "libmemcached-dev.managed",
           "sqlite"
end

dep "dma" do
  requires "ubuntu-java"

  requires "firefox",
           "xvfb.managed"
end

dep "smash-reports" do
  requires "ubuntu"

  requires "libyaml-dev.managed"
end
