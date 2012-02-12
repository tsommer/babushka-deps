meta :nginx do
  def nginx_bin;    nginx_prefix / "sbin/nginx" end
  def vhost_conf;   nginx_prefix / "conf/vhosts/#{domain}.conf" end
  def vhost_common; nginx_prefix / "conf/vhosts/#{domain}.common" end
  def vhost_link;   nginx_prefix / "conf/vhosts/on/#{domain}.conf" end

  def upstream_name
    "#{domain}.upstream"
  end

  def unicorn_socket
    path / 'tmp/sockets/unicorn.socket'
  end

  def nginx_running?
    shell? "netstat -an | grep -E '^tcp.*[.:]80 +.*LISTEN'"
  end

  def restart_nginx
    if nginx_running?
      log_shell "Restarting nginx", "#{nginx_bin} -s reload", :sudo => true
      sleep 1 # The reload just sends the signal, and doesn't wait.
    end
  end
end

dep "setup-ssl-vhost.nginx", :domain, :path, :listen_host, :listen_port, :nginx_prefix do
  listen_host.default!('[::]')
  listen_port.default!('80')
  path.default("~#{domain}/current".p) if shell?('id', domain)

  requires 'benhoskings:configured.nginx'.with(nginx_prefix)
  requires 'benhoskings:unicorn configured'.with(path)

  met? { @run }

  meet {
    render_erb "nginx/vhost.conf.erb", :to => vhost_conf, :sudo => true
    render_erb "nginx/vhost.common.erb", :to => vhost_common, :sudo => true

    @run = true
  }

  after {
    restart_nginx
  }
end

