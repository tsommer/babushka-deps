dep "wget", :template => "managed"

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

dep "libreadline5.managed" do
  "/lib/libreadline.so.5".p.exist?
end
