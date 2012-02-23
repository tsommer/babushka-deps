meta :logrotate do
  accepts_value_for :renders

  template {
    requires 'benhoskings:logrotate.managed'
    def conf_dest
      %w[
        /usr/local/etc/logrotate.d
        /etc/logrotate.d
      ].detect { |path|
        path.p.exists?
      }
    end

    met? {
      Babushka::Renderable.new(conf_dest).from?(dependency.load_path.parent / renders)
    }

    meet {
      render_erb renders, :to => conf_dest, :sudo => true
    }
  }
end

dep 'bluepill.logrotate' do
  renders "logrotate/bluepill.conf"
end

