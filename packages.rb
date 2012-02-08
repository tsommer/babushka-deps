dep "wget", :template => "managed"
dep "ack", :template => "managed"

dep "redis-server", :template => "managed"
dep "sqlite3", :template => "managed"

dep "libsqlite3-dev", :template => "managed"
dep "libpq-dev", :template => "managed"
dep "libsasl2-dev", :template => "managed"
dep "libmemcached-dev", :template => "managed"

dep "sqlite" do
  requires "sqlite3", "libsqlite3-dev.managed"
end

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
