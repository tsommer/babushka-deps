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
           "Jawbone Updater.app"

  # App Store
  # The Unarchiver
  # DoublePane
  # Acorn

  # dev
  requires "rvm",
           "TextMate.app",
           "GitX.app",
           "HTTP Client.app",
           "VirtualBox.installer",
           "CoRD.app",
           "Vico.app"
end

