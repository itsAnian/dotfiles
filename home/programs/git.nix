{
  programs.git = {
    enable = true;
    settings = {
      user.email = "anian.seidl@gmail.com";
      user.name = "itsAnian";
      push.autoSetupRemote = true;
      core.editor = "nvim";
      core.pager = "delta";
    };
  };

  programs.delta = {
    enable = true;
    options = {
      features = "decorations";
    };
  };

  home.shellAliases = {
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gl = "git log --oneline";
    gd = "git diff";
    gp = "git push";
    gpfusch = "git push --force-with-lease";
  };
}
