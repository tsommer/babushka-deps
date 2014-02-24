meta :cask do
  accepts_value_for :cask

  def ensure_cask
    return if `brew tap`.include?(cask)
    shell "brew tap #{cask}"
  end

  template {
    meet {
      ensure_cask
      shell "brew cask install #{name}"
    }

    met? {
      `brew cask list`.include? name
    }
  }
end

meta :brew do
  accepts_value_for :cask

  def ensure_cask
    return if `brew tap`.include?(cask)
    shell "brew tap #{cask}"
  end

  template {
    meet {
      ensure_cask
      shell "brew install #{name}"
    }

    met? {
      `brew list`.include? name
    }
  }
end
