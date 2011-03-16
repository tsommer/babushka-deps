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

dep "libopenssl-ruby.managed"
