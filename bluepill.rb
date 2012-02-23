dep "setup-babushka" do
  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate"
end

dep "bluepill-gem" do
  met? {
    grep sudo("gem list"), "bluepill"
  }

  meet {
    sudo "gem install bluepill"
  }
end

dep "bluepill-run-dir" do
  met? {
    Dir.exists? "var/run/bluepill"
  }

  meet {
    sudo "mkdir -p /var/run/bluepill"
  }
end

