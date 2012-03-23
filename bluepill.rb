meta :bluepill do
  accepts_value_for :renders
  accepts_value_for :as

  template {
    met? {
      Babushka::Renderable.new("#{root}/pills" / as).from?(dependency.load_path.parent / renders)
    }
    meet {
      render_erb renders, :to => conf_dest
    }
  }
end

dep "setup-bluepill", :path, :username do
  username.default(shell('whoami'))
  path.default('~')

  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate",
           "setup-pill-dir".with(path, username)
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
  }
end

dep "setup-pill-dir", :path do
  met? {
    File.exists? File.expand_path("#{path}/pills")
  }

  meet {
    shell "mkdir -p #{path}/pills"
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

