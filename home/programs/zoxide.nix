{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd z"
    ];
  };
  home.shellAliases = {
    cd = "z";
  };
}
