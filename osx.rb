dep "osx-settings.task" do

  run {
    log_shell "Expand expanded save panel by default",
      "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true"

    log_shell "Expand expanded print panel by default",
      "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true"

    log_shell "Disable Resume system-wide",
      "defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false"

    log_shell "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)",
      "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3"

    log_shell "Disable press-and-hold in favour of key repeat",
      "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false"

    # Set through KeyRemap4MacBook: 23 ms
    #log_shell "Set a blazingly fast keyboard repeat rate",
    #  "defaults write NSGlobalDomain KeyRepeat -int 0"

    # Set through KeyRemap4MacBook: 400 ms
    #log_shell "Set a short initial keyboard delay time",
    #  "defaults write NSGlobalDomain InitialKeyRepeat -int 15"

    log_shell "Show all filename extensions in Finder",
      "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"

    log_shell "Show hidden files in Finder",
      "defaults write com.apple.Finder AppleShowAllFiles false"

    log_shell "Show status bar in Finder",
      "defaults write com.apple.finder ShowStatusBar -bool true"

    log_shell "Disable the warning when changing a file extension",
      "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"

    log_shell "Don't create .DS_Store files on network volumes",
      "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"

    log_shell "Show ~/Library folder",
      "chflags nohidden ~/Library"

    log_shell "Allow text selection in QuickLook",
      "defaults write com.apple.finder QLEnableTextSelection -bool true"

    log_shell "Automatically hide and show the Dock",
      "defaults write com.apple.dock autohide -bool true"

    log_shell "Enable Safaris debug menu",
      "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true"

    log_shell "Disable the Ping sidebar in iTunes",
      "defaults write com.apple.iTunes disablePingSidebar -bool true"

    log_shell "Disable all the other Ping stuff in iTunes",
      "defaults write com.apple.iTunes disablePing -bool true"

    log_shell "Hide location services menu bar icon",
      "launchctl unload -w /System/Library/LaunchAgents/com.apple.locationmenu.plist"

    log_shell "Disable local Time Machine snapshots",
      "sudo tmutil disablelocal"

    log_shell "Prevent TimeMachine from asking for new backup disks",
      "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true"

    log_shell "Disable hibernate",
      "sudo pmset -a hibernatemode 0"
    log_shell "Remove sleepimage",
      "sudo rm /private/var/vm/sleepimage"
    log_shell "Create empty sleepimage placeholder",
      "sudo touch /private/var/vm/sleepimage"
    log_shell "Make empty sleepimage unmodifiable",
      "sudo chflags uchg /private/var/vm/sleepimage"

    log_shell "Turn off sudden motion sensor",
      "sudo pmset -a sms 0"

    log_shell "Disable menu bar transaparency",
      "defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false"

    log_shell "Enable debug menu in DiskUtility",
      "defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true"
  }
end

