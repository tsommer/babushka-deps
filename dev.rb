dep "iTerm.app" do
  source "http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120203.zip"
end

dep "oh-my-zsh" do
  requires "benhoskings:zsh"

  met? {
    "~/.zshrc".p.exist?
  }

  meet {
    shell "curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
  }
end

dep "TextMate.app" do
  source "http://download.macromates.com/TextMate_1.5.10.zip"
end

dep "Sublime Text 2.app" do
  source "http://www.sublimetext.com/Sublime%20Text%202%20Build%202051.dmg"
end

dep "Sequel Pro.app" do
  source "http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg"
end

dep "GitX.app" do
  source "http://frim.frim.nl/GitXStable.app.zip"
end

dep "HTTP Client.app" do
  source "http://ditchnet.org/httpclient/dist/HTTPClient.zip"
end

dep "VirtualBox.installer" do
  source "http://download.virtualbox.org/virtualbox/4.1.18/VirtualBox-4.1.18-78361-OSX.dmg"
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

dep "MacVim.app" do
  source "http://cloud.github.com/downloads/b4winckler/macvim/MacVim-snapshot-64.tbz"
end

dep "jshint", :template => "npm"
dep "coffee-script", :template => "npm"
dep "csslint", :template => "npm"

dep "filepath" do
  met? {
    "/usr/local/bin/filepath".p.exists?
  }

  meet {
    shell "wget https://github.com/downloads/chendo/filepath/filepath"
    sudo "cp filepath /usr/local/bin"
    sudo "chmod +x /usr/local/bin/filepath"
  }
end

