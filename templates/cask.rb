# https://github.com/phinze/homebrew-cask
meta :cask do
  template {
    requires "brew tap".with("phinze/cask"),
             "brew-cask"

    meet {
      shell "brew cask install #{name}"
    }

    met? {
      `brew cask list`.include? name
    }
  }
end


