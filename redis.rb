dep "redis-apt-repository" do
  met? { "/etc/apt/sources.list".p.grep /dotdeb/ }

  meet {
    sources = <<-SRC

# Dotdeb sources for up-to-date redis
deb http://packages.dotdeb.org squeeze all
deb-src http://packages.dotdeb.org squeeze all
    SRC

    sudo "echo '#{sources}' >> /etc/apt/sources.list"

    cd("/tmp") {
      sudo "wget http://www.dotdeb.org/dotdeb.gpg"
      sudo "cat dotdeb.gpg | apt-key add -"
    }

    sudo "apt-get update"
  }
end

dep "redis-server.managed" do
  requires "redis-apt-repository"
end

