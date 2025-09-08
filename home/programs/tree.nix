{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
  ];

  home.shellAliases = {
      tree = "tree -a -l";
  };
}
