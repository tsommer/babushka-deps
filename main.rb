dep "main" do

  # load osx settings
  requires "osx-settings.task"

  # packages
  requires "wget",
           "ack"

  # system
  requires "Dropbox.app",
           "Google Drive.app",
           "PCKeyboardHack.installer",
           "Alfred.app",
           "iStat Menus.app",
           "AUSkey_Software.installer",
           "GrandPerspective.app",
           "Google Chrome.app",
           "Firefox.app",
           "Skype.app",
           "Jawbone Updater.app",
           "MenuBarFilter.app",
           "Satellite Eyes.app",
           "gfxCardStatus.app"

  # App Store
  # The Unarchiver
  # DoublePane
  # Acorn
  # Fantastical
  # HTTP Client

  # dev
  requires "iTerm.app",
           "MacVim.app",
           "GitX.app",
           "CoRD.app",
           "Sequel Pro.app",
           "VirtualBox.installer",
           "oh-my-zsh"
end

