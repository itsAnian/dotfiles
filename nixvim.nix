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
      web-devicons.enable = true;
      dashboard = {
	enable = true;
      };
      lazygit.enable = true;
      image.enable = true;
      treesitter = {
	enable = true;
	grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
	  c
	  bash
	  json
	  lua
	  make
	  markdown
	  nix
	  regex
	  toml
	  vim
	  vimdoc
	  xml
	  yaml
	];
      };
      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.sources = [
	  { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	];
      };
      render-markdown.enable = true;
      telescope = {
	enable = true;
	settings = {
	  defaults = {
	    file_ignore_patterns = [
	      "^.git/"
		"^.mypy_cache/"
		"^__pycache__/"
		"^output/"
		"^data/"
		"%.ipynb"
	    ];
	    layout_config = {
	      prompt_position = "top";
	    };
	    mappings = {
	      i = {
		"<A-j>" = {
		  __raw = "require('telescope.actions').move_selection_next";
		};
		"<A-k>" = {
		  __raw = "require('telescope.actions').move_selection_previous";
		};
	      };
	    };
	    selection_caret = "> ";
	    set_env = {
	      COLORTERM = "truecolor";
	    };
	    sorting_strategy = "ascending";
	  };
	};
      };

      trim = {
	enable = true;
	settings = {
	  ft_blocklist = [
	    "markdown"
	  ];
	  highlight = true;
	  patterns = [
	    ''
	      [[%s/

	      )
		+/1/]]''
	  ];
	  trim_on_write = false; #Throws error if enabled
	};
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
      action = "<cmd>w | Ex<CR>";
    }
    ];
#plugins.lualine.enable = true;
  };
}
