meta :bluepill do
  accepts_value_for :renders
  accepts_value_for :as

  template {
    met? {
      Babushka::Renderable.new(root / "pills" / as).from?(dependency.load_path.parent / renders)
    }
    meet {
      render_erb renders, :to => (root / "pills" / as)
    }
  }
end

dep "setup-bluepill", :root do
  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate",
           "setup-pill-dir".with(root)
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

dep "setup-pill-dir", :root do
  username.default(shell('whoami'))
  root.default('~')

  met? {
    File.exists? File.expand_path("#{root}/pills")
  }

  meet {
    shell "mkdir -p #{root}/pills"
  }
end

dep "delayed_job.bluepill", :username, :root, :env do
  renders "bluepill/delayed_job.conf"
  as "delayed_job.pill"
end

dep "unicorn.bluepill", :username, :root, :env do
  renders "bluepill/unicorn.conf"
  as "unicorn.pill"
end

