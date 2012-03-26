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

dep "setup-bluepill", :username do
  requires "bluepill-gem",
           "bluepill-run-dir",
           "bluepill.logrotate",
           "setup-pill-dir",
           "bluepill-startup-script".with(username)
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

dep "bluepill-startup-script", :username do
  on :linux do
    requires 'benhoskings:rcconf.managed'

    met? {
      shell("rcconf --list").val_for('bluepill') == 'on'
    }
    meet {
      render_erb 'bluepill/bluepill.init.d.erb', :to => '/etc/init.d/bluepill', :perms => '755', :sudo => true
      sudo 'update-rc.d bluepill defaults'
    }
  end
end

dep "delayed_job.bluepill", :username, :env do
  renders "bluepill/delayed_job.conf"
  as "delayed_job.pill"
end

dep "unicorn.bluepill", :username, :env do
  renders "bluepill/unicorn.conf"
  as "unicorn.pill"
end

