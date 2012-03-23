meta :bluepill do
  accepts_value_for :renders
  accepts_value_for :as

  template {
    met? {
      Babushka::Renderable.new("~/pills" / as).from?(dependency.load_path.parent / renders)
    }
    meet {
      render_erb renders, :to => ("~/pills" / as)
    }
  }
end

dep "setup-bluepill" do
  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate",
           "setup-pill-dir"
end

dep "bluepill-gem" do
  met? {
    shell("gem list") =~ /bluepill/
  }
  meet {
    shell "gem install bluepill --no-rdoc --no-ri"
  }
end

dep "bluepill-run-dir" do
  met? {
    File.exists? "/var/run/bluepill"
  }
  meet {
    sudo "mkdir -p /var/run/bluepill"
    sudo "chmod 777 /var/run/bluepill"
  }
end

dep "setup-pill-dir" do
  met? {
    File.exists? File.expand_path("~/pills")
  }
  meet {
    shell "mkdir -p ~/pills"
  }
end

dep "delayed_job.bluepill", :username, :env do
  renders "bluepill/delayed_job.conf"
  as "delayed_job.pill"
end

dep "unicorn.bluepill", :username, :env do
  renders "bluepill/unicorn.conf"
  as "unicorn.pill"
end

