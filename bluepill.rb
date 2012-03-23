meta :bluepill do
  accepts_value_for :renders
  accepts_value_for :as
  template {
    requires 'setup-bluepill'
    def conf_dest
      "#{path}/#{username}/pills".detect {|path|
        path.p.exists?
      } / as
    end
    met? {
      Babushka::Renderable.new(conf_dest).from?(dependency.load_path.parent / renders)
    }
    meet {
      render_erb renders, :to => conf_dest
    }
  }
end

dep "setup-bluepill", :path, :username do
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

dep "setup-pill-dir", :path, :username do
  met? {
    File.exists? "#{path}/#{username}/pills"
  }

  meet {
    shell "mkdir -p #{path}/#{username}/pills"
  }
end

dep "delayed_job.bluepill" do
  renders "bluepill/pill.conf"
  as "delayed_job.pill"
end

