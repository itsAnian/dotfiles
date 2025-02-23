{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
      ./render-markdown.nix
      ./dashboard.nix
      ./telescope.nix
      ./trim.nix
      ./treesitter.nix
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
      web-devicons.enable = true;
      lazygit.enable = true;
      image.enable = true;
      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.sources = [
	{ name = "nvim_lsp"; }
	{ name = "path"; }
	{ name = "buffer"; }
	];
      };
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
      action = "<cmd>w | :Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>d";
      options.silent = true;
      action = "<cmd>w | :Dashboard<CR>";
    }
    ];
#plugins.lualine.enable = true;
  };
}
