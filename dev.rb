dep "iTerm.app" do
  source "http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip"
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
  source "http://sequel-pro.googlecode.com/files/sequel-pro-1.0.1.dmg"
end

dep "GitX.app" do
  source "http://frim.frim.nl/GitXStable.app.zip"
end

dep "HTTP Client.app" do
  source "http://ditchnet.org/httpclient/dist/HTTPClient.zip"
end

dep "VirtualBox.installer" do
  source "http://dlc.sun.com.edgesuite.net/virtualbox/4.2.6/VirtualBox-4.2.6-82870-OSX.dmg"
  met? { "/Applications/VirtualBox.app".p.exists? }
end

dep "CoRD.app" do
  source "http://waix.dl.sourceforge.net/project/cord/cord/0.5.7/CoRD_0.5.7.zip"
end

dep "EVE.app" do
  source "https://s3.amazonaws.com/hotkeyeve/Downloads/EVE-latest.zip"
end

dep "Shortcat.app" do
  source "http://updates.shortcatapp.com/v0.3.8/Shortcat.app.zip"
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

dep "Omnigraffle.app" do
  source "http://downloads2.omnigroup.com/software/MacOSX/10.6/OmniGraffle-5.4.2.dmg"
end

dep "jshint", :template => "npm"
dep "coffee-script", :template => "npm"
dep "csslint", :template => "npm"
dep "jwalk", :template => "npm"

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

dep "the_silver_searcher", :template => "managed" do
  provides 'ag'
end

dep "colout.pip" do
  provides "colout"

  meet {
    sudo "pip install colout"
  }
end

dep "zsh", :template => "managed" do
  provides "zsh"

  meet {
    shell "brew install --disable-etcdir zsh"
  }
end

dep "node", :template => "managed"
dep "hub", :template => "managed"
dep "ghostscript", :template => "managed"
dep "ctags", :template => "managed"
dep "vim", :template => "managed"
dep "python", :template => "managed"
