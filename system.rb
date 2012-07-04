dep "Dropbox.app" do
  source "https://ddr3luum8vl5r.cloudfront.net/Dropbox%201.4.9.dmg"
end

dep "Google Drive.app" do
  source "https://dl-ssl.google.com/drive/installgoogledrive.dmg"
end

dep "KeyRemap4MacBook.installer" do
  source "http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.8.0.dmg"
  met? {
    "/Library/PreferencePanes/KeyRemap4MacBook.prefPane".p.exist?
  }
end

dep "PCKeyboardHack.installer" do
  source "http://pqrs.org/macosx/keyremap4macbook/files/PCKeyboardHack-7.4.0.dmg"
  met? {
    "/Library/PreferencePanes/PCKeyboardHack.prefPane".p.exist?
  }
end

dep "Alfred.app" do
  source "http://rwc.cachefly.net/alfred_1.2_220.dmg"
end

dep "Growl.installer" do
  source "http://growl.cachefly.net/Growl-1.2.1.dmg"
  provides "growlnotify"
end

dep "iStat Menus.app" do
  source "http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.23.zip"
end

dep "Jumpcut.app" do
  source "http://downloads.sourceforge.net/jumpcut/Jumpcut_0.63.tgz"
end

dep "NeoOffice.installer" do
  source "http://neooffice.trideja.com/NeoOffice-3.1.2-Intel.dmg"
  met? {
    "/Applications/NeoOffice.app".p.exist?
  }
end

dep "AUSkey_Software.installer" do
  source "https://www.auskey.abr.gov.au/plugin/AUSkey_software.dmg"
  met? {
    "~/Library/Application\ Support/AUSkey".p.exist?
  }
end

dep "CoRD.app" do
  source "http://internode.dl.sourceforge.net/project/cord/cord/0.5.4/CoRD_0.5.4.zip"
end

dep "Acorn.app" do
  source "http://flyingmeat.com/download/Acorn.zip"
end

dep "Perian.installer" do
  source "http://perian.cachefly.net/Perian_1.2.2.dmg"
  met? {
    "/Library/PreferencePanes/Perian.prefPane".p.exist?
  }
end

dep "EarthDesk.installer" do
  source "http://mirror.xericdesign.com/software/earthdesk.dmg"
  met? {
    "/Library/PreferencePanes/EarthDesk.prefPane".p.exist?
  }
end

dep "Vico.app" do
  source "http://www.vicoapp.com/download/vico-r1771.dmg"
end

dep "GrandPerspective.app" do
  source "http://aarnet.dl.sourceforge.net/project/grandperspectiv/grandperspective/1.5.0/GrandPerspective-1_5_0.dmg"
end

dep "The Unarchiver.app" do
  source "http://theunarchiver.googlecode.com/files/TheUnarchiver2.7.1.zip"
end

dep "Evom.app" do
  source "http://files.thelittleappfactory.com/evom/Evom.zip"
end

dep "Google Chrome.app" do
  source "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
end

dep "Firefox.app" do
  source "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/13.0.1/mac/en-US/Firefox%2013.0.1.dmg"
end

dep "Opera.app" do
  source "http://get4.opera.com/pub/opera/mac/1161/Opera_11.61_Setup_Intel.dmg"
end

dep "firefox", :template => "managed"

dep "Skype.app" do
  source "http://download.skype.com/macosx/Skype_5.8.0.865.dmg"
end

dep "Raven.app" do
  source "http://raven.ipodtutofast.com/Raven.zip"
end

dep "Jawbone Updater.app" do
  source "https://mytalk.jawbone.com/store/dashboard/Jawbone_Updater-1.7.0.1.zip"
end

