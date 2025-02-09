{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.neovim.enable = true;
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      shiftwidth = 2;
    };

    plugins = {
      transparent.enable = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
#plugins.lualine.enable = true;
  };
}
