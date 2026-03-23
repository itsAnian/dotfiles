{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd z"
    ];
  };
  home.shellAliases = {
    cd = "z";
  };
}
