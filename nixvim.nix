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
    globals.mapleader = " ";

    opts = {
      number = true;
      shiftwidth = 2;
      clipboard = "unnamedplus";
    };

    plugins = {
      transparent.enable = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    keymaps = [
    {
      mode = "n";
      key = "<leader>w";
      options.silent = true;
      action = "<cmd>normal! ggVG= <CR> :w<CR>";
    }
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      action = "<cmd>w | Ex<CR>";
    }
    ];
#plugins.lualine.enable = true;
  };
}
