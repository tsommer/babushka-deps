dep "iTerm.app" do
  source "http://iterm2.googlecode.com/files/iTerm2-alpha17.zip"
end

dep "Dropbox.app" do
  source "http://cdn.dropbox.com/Dropbox%201.0.20.dmg"
end

dep "KeyRemap4MacBook.installer" do
  source "http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.2.0.pkg.zip"
  met? {
    "/Library/PreferencePanes/KeyRemap4MacBook.prefPane".p.exist?
  }
end
