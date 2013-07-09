dep "dev" do

  # load osx settings
  requires "osx-settings.task"

  # system
  requires "Dropbox.app",
           "Google Drive.app",
           "KeyRemap4MacBook.app",
           "Alfred.app",
           "iStat Menus.app",
           "Google Chrome.app",
           "Firefox.app",
           "Skype.app",
           "Satellite Eyes.app",
           "MenuBarFilter.app",
           "gfxCardStatus.app",
           "Bartender.app",
           "Spectacle.app",
           "Skitch.app"

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
           "Shortcat.app",
           "Sequel Pro.app"

  # packages
  requires "wget",
           "ack",
           "macvim.bin",
           "node",
           "python",
           "jshint",
           "coffee-script",
           "csslint",
           "the_silver_searcher",
           "hub",
           "jwalk",
           "ctags",
           "vim",
           "colout.pip"
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

  # dev
  requires "imagemagick.managed"
end

dep "rboffice" do
  requires "dev"

  requires "Spotify.app",
           "ghostscript"
end

