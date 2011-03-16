dep "main" do
  requires "apps"
end

dep "apps" do

  # system
  requires "iTerm.app",
	   "Dropbox.app",
	   "KeyRemap4MacBook.installer"

  # web
  requires "Google Chrome.app",
           "Firefox.app"

  # dev
  requires "TextMate.app",
	   "Sublime Text 2.app",
	   "Sequel Pro.app",
	   "GitX.app",
	   "HTTP Client.app"
end

