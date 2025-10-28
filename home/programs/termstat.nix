{inputs, ...}: {
  programs.termstat = {
    enable = true;
    enableZshIntegration = true;
  };

  imports = [
    inputs.termstat.homeManagerModules.default
  ];
}
