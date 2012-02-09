dep "web repo", :path do
  requires "benhoskings:web repo".with(path),
           "replace-post-receive-hook".with(path)
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

dep "up to date.repo", :git_ref_data, :env do
  env.default!(ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'production')
  requires [
    'benhoskings:on correct branch.repo'.with(ref_info[:branch]),
    'benhoskings:HEAD up to date.repo'.with(ref_info),
    'benhoskings:app bundled'.with(:root => '.', :env => env)

    # This and 'after deploy' below are separated so the deps in 'current dir'
    # they refer to load from the new code checked out by 'HEAD up to date.repo'.
    # Normally it would be fine because dep loading is lazy, but the "if Dep('...')"
    # checks trigger a source load when called.
    # 'on deploy'.with(ref_info[:old_id], ref_info[:new_id], ref_info[:branch], env),

    # 'app flagged for restart.task',
    # 'maintenance page down',
    # 'after deploy'.with(ref_info[:old_id], ref_info[:new_id], ref_info[:branch], env)
  ]

end

