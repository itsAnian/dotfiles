{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with pkgs.spicePkgs.extensions; [
      hidePodcasts
      fullAppDisplay
      shuffle
    ];
    theme = pkgs.spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
