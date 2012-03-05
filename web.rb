dep "Google Chrome.app" do
  source "https://dl-ssl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg"
end

dep "Firefox.app" do
  source "http://mozilla.ftp.halifax.rwth-aachen.de/mozilla/firefox/releases/4.0/mac/en-US/Firefox%204.0.dmg"
end

dep "Opera.app" do
  source "http://get4.opera.com/pub/opera/mac/1161/Opera_11.61_Setup_Intel.dmg"
end

dep "firefox", :template => "managed"

dep "Skype.app" do
  source "http://www.skype.com/go/getskype-macosx.dmg"
end

dep "Raven.app" do
  source "http://raven.ipodtutofast.com/Raven.zip"
end
