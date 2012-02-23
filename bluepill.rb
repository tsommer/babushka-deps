dep "setup-bluepill" do
  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate"
end

dep "bluepill-gem" do
  met? {
    sudo("gem list") =~ /bluepill/
  }

  meet {
    sudo "gem install bluepill --no-rdoc --no-ri"
  }
end

dep "bluepill-run-dir" do
  met? {
    File.exists? "var/run/bluepill"
  }

  meet {
    sudo "mkdir -p /var/run/bluepill"
  }
end

