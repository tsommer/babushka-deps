dep "Dropbox.app" do
  source "https://d1ilhw0800yew8.cloudfront.net/client/Z/Dropbox%201.6.16.dmg"
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
  source "http://pqrs.org/macosx/keyremap4macbook/files/PCKeyboardHack-9.0.0.dmg"
  met? {
    "/Library/PreferencePanes/PCKeyboardHack.prefPane".p.exist?
  }
end

dep "Alfred.app" do
  source "http://cachefly.alfredapp.com/alfred_1.3.2_265.zip"
end

dep "Growl.installer" do
  source "http://growl.cachefly.net/Growl-1.2.1.dmg"
  provides "growlnotify"
end

dep "iStat Menus.app" do
  source "http://s3.amazonaws.com/bjango/files/istatmenus4/istatmenus4.03.zip"
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
  source "http://sourceforge.net/projects/grandperspectiv/files/grandperspective/1.5.1/GrandPerspective-1_5_1.dmg/download"
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
  source "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/18.0.1/mac/en-US/Firefox%2018.0.1.dmg"
end

dep "Opera.app" do
  source "http://get4.opera.com/pub/opera/mac/1161/Opera_11.61_Setup_Intel.dmg"
end

dep "firefox", :template => "managed"

dep "Skype.app" do
  source "http://download.skype.com/macosx/Skype_6.1.59.2295.dmg"
end

dep "Raven.app" do
  source "http://raven.ipodtutofast.com/Raven.zip"
end

dep "Jawbone Updater.installer" do
  source "http://mytalk.jawbone.com/jb2/mytalk/fileDownload?file=UPDATER"
  met? {
    "/Applications/Jawbone Updater.app".p.exist?
  }
end

dep "MenuBarFilter.app" do
  source "http://eece.github.com/MenuBarFilter/MenuBarFilter.zip"
end

dep "Satellite Eyes.app" do
  source "http://satellite-eyes.s3.amazonaws.com/satellite-eyes-head.zip"
end

dep "gfxCardStatus.app" do
  source "http://codykrieger.com/downloads/gfxCardStatus-2.3.zip"
end

dep "Broomstick.app" do
  source "http://downloads.zibity.com/Broomstick/Zips/Broomstick%200.9.1.zip"
end

dep "VLC.app" do
  source "http://waix.dl.sourceforge.net/project/vlc/2.0.5/macosx/vlc-2.0.5.dmg"
end

dep "Transmission.app" do
  source "http://transmission.cachefly.net/Transmission-2.76.dmg"
end

dep "Sparrow.app" do
  source "http://www.google.com/landing/files/Sparrow-latest.zip"
end

dep "Mailplane.app" do
  source "http://mailplaneapp.com/mpdownloads/builds/Mailplane_3_377.zip"
end

dep "Bartender.app" do
  source "http://www.macbartender.com/Demo/Bartender.zip"
end

dep "Picasa Web Albums Uploader.app" do
  source "http://universal-downloader.en.softonic.com/54000/54526/1ecf9/InstallPicasaWebAlbumsUploaders.dmg"
end

