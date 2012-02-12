meta :nginx do
  def vhost_conf;   nginx_prefix / "conf/vhosts/#{domain}.conf" end
  def vhost_common; nginx_prefix / "conf/vhosts/#{domain}.common" end
  def vhost_link;   nginx_prefix / "conf/vhosts/on/#{domain}.conf" end

  def upstream_name
    "#{domain}.upstream"
  end

  def unicorn_socket
    path / 'tmp/sockets/unicorn.socket'
  end
end

dep "setup-ssl-vhost", :domain, :path, :listen_host, :listen_port, :nginx_prefix, :enable_ssl, :force_ssl do
  listen_host.default!('[::]')
  listen_port.default!('80')
  path.default("~#{domain}/current".p) if shell?('id', domain)

  requires 'configured.nginx'.with(nginx_prefix)
  requires 'unicorn configured'.with(path)

  met? { @run }

  meet {
    render_erb "nginx/vhost.conf.erb", :to => vhost_conf, :sudo => true
    render_erb "nginx/vhost.common.erb", :to => vhost_common, :sudo => true

    @run = true
  }
end
