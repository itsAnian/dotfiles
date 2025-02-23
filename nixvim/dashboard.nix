{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    plugins = {
      dashboard = {
	enable = true;
	settings = {
	  theme = "hyper";
	  config = {
	    footer = [
	      " "
	    ];
	    header = [
	      "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
		"████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
		"██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
		"██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
		"██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
		"╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
	    ];
	    mru = {
	      limit = 20;
	    };
	    project = {
	      enable = false;
	      action = "Telescope find_files cwd=~/projects";
	      limit = 8;
	    };
	    shortcut = [
	    {
	      action = {
		__raw = "function(path) vim.cmd('Telescope find_files') end";
	      };
	      desc = "Files";
	      group = "Label";
	      icon = " ";
	      icon_hl = "@variable";
	      key = "f";
	    }
	    /*{
	      action = "Telescope Apps";
	      desc = " Apps";
	      group = "DiagnosticHint";
	      key = "p";
	      }*/
	    {
	      action = {
		__raw = "function() require('telescope.builtin').find_files({ cwd = '~/dotfiles' }) end";
	      };
	      desc = " dotfiles";
	      group = "Number";
	      key = "d";
	    }
	    ];
	    week_header = {
	      enable = false;
	    };
	  };
	};
      };
    };
  };
}
