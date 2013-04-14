# deps with bins
dep "build-essential", :template => "managed"
dep "wget", :template => "managed"
dep "ack", :template => "managed"
dep "postfix", :template => "managed"
dep "zip", :template => "managed"
dep "unzip", :template => "managed"

dep "macvim.bin" do
  installs "macvim.managed"
  provides "mvim"
end

dep "redis-server", :template => "managed"
dep "sqlite3", :template => "managed"

dep "sqlite" do
  requires "sqlite3", "libsqlite3-dev.managed"
end

dep "sphinx.src" do
  source "http://sphinxsearch.com/files/sphinx-0.9.9.tar.gz"
  provides "searchd"
end

dep "imagemagick.managed" do
  provides ["identify", "convert"]
end

dep "openjdk-6-jdk.managed" do
  provides ["java", "javac"]
end

dep "rabbitmq-server.managed" do
  provides "rabbitmq-server"
end


# System deps
dep "libxml2-dev.managed" do
  met? {
    "/usr/include/libxml2".p.exist?
  }
end

dep "libxslt-dev.managed" do
  met? {
    "/usr/include/libxslt".p.exist?
  }
end

dep "libssl-dev.managed" do
  met? {
    "/usr/lib/libssl.so.0.9.8".p.exist?
  }
end

dep "libopenssl-ruby.managed" do
  met? {
    "/usr/share/doc/libopenssl-ruby/copyright".p.exist?
  }
end

dep "libcurl4-openssl-dev.managed" do
  met? {
    "/usr/bin/curl-config".p.exist?
  }
end

dep "libreadline5-dev.managed" do
  met? {
    "/usr/lib/libreadline.so".p.exist?
  }  
end

dep "libreadline6-dev.managed" do
  met? {
    "/lib/libreadline.so.6".p.exist?
  }
end

dep "libfreeimage-dev.managed" do
  met? {
    "/usr/include/FreeImage.h".p.exist?
  }
end

dep "libmagick9-dev.managed" do
  met? {
    "/usr/bin/Magick-config".p.exist?
  }
end

dep "libsasl2-dev.managed" do
  met? {
    "/usr/lib/libsasl2.a".p.exist?
  }
end

dep "libmemcached-dev.managed" do
  met? {
    "/usr/lib/libmemcached.so".p.exist?
  }
end

dep "libsqlite3-dev.managed" do
  met? {
    "/usr/include/sqlite3.h".p.exist?
  }
end

dep "xvfb.managed" do
  met? {
    "/usr/bin/Xvfb".p.exist?
  }
end

dep "libyaml-dev.managed" do
  met? {
    "/usr/include/yaml.h".p.exist?
  }
end

dep "libpq-dev.managed" do
  met? {
    "/usr/include/postgresql/libpq-fe.h".p.exist?
  }
end

dep "libgeoip-dev.managed" do
  met? {
    "/usr/include/GeoIP.h".p.exist?
  }
end

dep "graphicsmagick-libmagick-dev-compat.managed" do
  met? {
    "/usr/bin/Magick-config".p.exist?
  }
end

dep "libmagickwand-dev.managed" do
  met? {
    "/usr/include/ImageMagick/wand/MagickWand.h".p.exist?
  }
end

