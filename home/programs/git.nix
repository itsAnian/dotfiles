{
  programs.git = {
    enable = true;
    userEmail = "anian.seidl@gmail.com";
    userName = "itsAnian";
    delta = {
      enable = true;
      options = {
        features = "decorations";
      };
    };
    extraConfig = {
      push.autoSetupRemote = true;
      core.editor = "nvim";
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
