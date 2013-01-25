dep "main" do

  # load osx settings
  requires "osx-settings.task"

  # system
  requires "Dropbox.app",
           "Google Drive.app",
           "PCKeyboardHack.installer",
           "KeyRemap4MacBook.installer",
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
           "Bartender.app",
           "VLC.app",
           "Transmission.app",
           "Picasa Web Albums Uploader.app"

  # App Store
  # The Unarchiver
  # Acorn
  # Fantastical
  # HTTP Client
  # FreeSpace
  # Spectacle
  # Xcode

  # dev
  requires "iTerm.app",
           "GitX.app",
           "CoRD.app",
           "VirtualBox.installer",
           "oh-my-zsh",
           "EVE.app",
           "Shortcat.app"

  # packages
  requires "wget",
           "ack",
           "macvim.bin",
           "jshint",
           "coffee-script",
           "csslint",
           "the_silver_searcher",
           "hub",
           "jwalk"
end

