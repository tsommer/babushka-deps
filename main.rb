dep "main" do

  # load osx settings
  requires "osx-settings.task"

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
           "Jawbone Updater.installer",
           "MenuBarFilter.app",
           "Satellite Eyes.app",
           "gfxCardStatus.app",
           "Broomstick.app",
           "VLC.app"

  # App Store
  # The Unarchiver
  # DoublePane
  # Acorn
  # Fantastical
  # HTTP Client
  # FreeSpace

  # dev
  requires "iTerm.app",
           "GitX.app",
           "CoRD.app",
           "Sequel Pro.app",
           "VirtualBox.installer",
           "oh-my-zsh"

  # packages
  requires "wget",
           "ack",
           "macvim.bin",
           "jshint",
           "coffee-script"
end

