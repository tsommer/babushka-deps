dep "brew-cask", :template => "managed" do
  met? {
    `brew cask`.include? "Caskroom"
  }
end

meta :cask do
  accepts_value_for :cask

  def ensure_cask
    return if `brew tap`.include?(cask)
    shell "brew tap #{cask}"
  end

  template {
    requires "brew-cask"

    meet {
      ensure_cask
      shell "brew install #{name}"
    }

    met? {
      `brew list`.include? name
    }
  }
end
