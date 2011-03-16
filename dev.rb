dep "rvm" do
  met? {
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell 'bash -c "`curl http://rvm.beginrescueend.com/releases/rvm-install-head`"'
  }
end

dep "TextMate.app" do
  source "http://download.macromates.com/TextMate_1.5.10.zip"
end

dep "Sublime Text 2.app" do
  source "http://www.sublimetext.com/Sublime%20Text%202%20Build%202047.dmg"
end

dep "Sequel Pro.app" do
  source "http://sequel-pro.googlecode.com/files/sequel-pro-0.9.8.1.dmg"
end

dep "GitX.app" do
  source "http://frim.frim.nl/GitXStable.app.zip"
end

dep "HTTP Client.app" do
  source "http://ditchnet.org/httpclient/dist/HTTPClient.zip"
end

dep "VirtualBox.installer" do
  source "http://download.virtualbox.org/virtualbox/4.0.4/VirtualBox-4.0.4-70112-OSX.dmg"
  met? { "/Applications/VirtualBox.app".p.exists? }
end

dep "mysql", :template => "managed"
