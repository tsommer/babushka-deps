dep "iTerm.app" do
  source "http://iterm2.googlecode.com/files/iTerm2-beta1.zip"
end

dep "oh-my-zsh" do
  met? {
    "~/.zshrc".p.exist?
  }

  meet {
    shell "wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh"
  }
end

dep "Dropbox.app" do
  source "http://cdn.dropbox.com/Dropbox%201.1.24.dmg"
end

dep "KeyRemap4MacBook.installer" do
  source "http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.2.0.pkg.zip"
  met? {
    "/Library/PreferencePanes/KeyRemap4MacBook.prefPane".p.exist?
  }
end

dep "PCKeyboardHack.installer" do
  source "http://pqrs.org/macosx/keyremap4macbook/files/PCKeyboardHack-6.3.0.pkg.zip"
  met? {
    "/Library/PreferencePanes/PCKeyboardHack.prefPane".p.exist?
  }
end

dep "Alfred.app" do
  source "http://media.alfredapp.com/alfred_0.8.2_107.dmg"
end

dep "Growl.installer" do
  source "http://growl.cachefly.net/Growl-1.2.1.dmg"
  provides "growlnotify"
end

dep "iStat Menus.app" do
  source "http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.16.zip"
end

dep "Jumpcut.app" do
  source "http://downloads.sourceforge.net/jumpcut/Jumpcut_0.63.tgz"
end

dep "NeoOffice.installer" do
  source "http://neooffice.trideja.com/NeoOffice-3.2_Beta-Intel.dmg"
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
