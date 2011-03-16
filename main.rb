dep "main" do
  requires "apps"
end

dep "apps" do

  # web
  requires "Google Chrome.app",
           "Firefox.app"
end

