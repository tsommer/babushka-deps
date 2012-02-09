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
