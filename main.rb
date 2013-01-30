dep "dev" do

  # load osx settings
  requires "osx-settings.task"

  # system
  requires "Dropbox.app",
           "Google Drive.app",
           "KeyRemap4MacBook.installer",
           "Alfred.app",
           "iStat Menus.app",
           "Google Chrome.app",
           "Firefox.app",
           "Skype.app",
           "Satellite Eyes.app",
           "MenuBarFilter.app",
           "gfxCardStatus.app",
           "Bartender.app",
           "Spectacle.app"

  ## App Store
  # The Unarchiver
  # Acorn
  # Fantastical
  # HTTP Client
  # FreeSpace
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
           "node",
           "jshint",
           "coffee-script",
           "csslint",
           "the_silver_searcher",
           "hub",
           "jwalk"
end

dep "main" do
  requires "dev"

  # system
  requires "AUSkey_Software.installer",
           "GrandPerspective.app",
           "Jawbone Updater.installer",
           "VLC.app",
           "Transmission.app",
           "Picasa Web Albums Uploader.app"
end

