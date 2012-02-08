dep "rvm" do
  met? {
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell 'bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'
  }
end

dep "TextMate.app" do
  source "http://download.macromates.com/TextMate_1.5.10.zip"
end

dep "Sublime Text 2.app" do
  source "http://www.sublimetext.com/Sublime%20Text%202%20Build%202051.dmg"
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
  source "http://download.virtualbox.org/virtualbox/4.0.6/VirtualBox-4.0.6-71344-OSX.dmg"
  met? { "/Applications/VirtualBox.app".p.exists? }
end

dep "coffeescript.src" do
  requires "benhoskings:nodejs.src"

  source 'git://github.com/jashkenas/coffee-script.git'
  provides 'coffee ~> 1.1.1'

  configure { true }
  build { shell "bin/cake build" }
  install { shell "bin/cake install" }
end

dep "Viscosity.app" do
  source "http://www.thesparklabs.com/downloads/Viscosity1.3.1.dmg"
end

dep "GitHub.app" do
  source "https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%201.0.zip"
end
