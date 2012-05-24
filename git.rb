dep "web repo with secrets", :path do
  requires "benhoskings:web repo".with(path),
           "replace-post-receive-hook".with(path),
           "clone-secrets-repo"
end

dep "replace-post-receive-hook", :path do
  met? {
    (path / ".git/hooks/post-receive").executable? &&
    Babushka::Renderable.new(path / ".git/hooks/post-receive").from?(dependency.load_path.parent / "git/deploy-repo-post-receive")
  }

  meet {
    cd path, :create => true do
      render_erb "git/deploy-repo-post-receive", :to => ".git/hooks/post-receive"
      shell "chmod +x .git/hooks/post-receive"
    end
  }
end

dep "clone-secrets-repo", :secrets_repo do
  met? { ('~' / 'secrets' / '.git').dir? }

  meet {
    shell "git clone #{secrets_repo} ~/secrets"
  }
end

dep 'up to date.repo', :git_ref_data, :env do
  env.default!(ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'production')
  requires [
    'benhoskings:on correct branch.repo'.with(ref_info[:branch]),
    'benhoskings:HEAD up to date.repo'.with(ref_info),
    'update-configs'.with(:root => "."),
    'benhoskings:app bundled'.with(:root => '.', :env => env),
    'migrate-db.task'.with(:root => '.', :env => env),
    'regenerate-assets.task'.with(:root => '.', :env => env),
    'update-crontab.task'.with(:root => '.', :env => env),

    # This and 'after deploy' below are separated so the deps in 'current dir'
    # they refer to load from the new code checked out by 'HEAD up to date.repo'.
    # Normally it would be fine because dep loading is lazy, but the "if Dep('...')"
    # checks trigger a source load when called.
    'benhoskings:on deploy'.with(ref_info[:old_id], ref_info[:new_id], ref_info[:branch], env),

    'stop-bluepill.task'.with(:username => shell('whoami')),
    'benhoskings:unicorn restarted',
    'benhoskings:maintenance page down',
    'restart-delayed-job'.with(:root => ".", :env => env),
    'start-bluepill.task'.with(:username => shell('whoami')),
    'benhoskings:after deploy'.with(ref_info[:old_id], ref_info[:new_id], ref_info[:branch], env)
  ]
end

dep "update-configs", :root do
  met? { @run }

  meet {
    shell "cd ~/secrets && git pull"
    shell "cd #{root}/config && for f in $(ls -d ~/secrets/config/*); do ln -fs $f; done"

    @run = true
  }
end
