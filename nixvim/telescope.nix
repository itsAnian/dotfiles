{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
      fd
  ];

  programs.nixvim = {
    plugins = {
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
    };
  };
}

