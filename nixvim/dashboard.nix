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
	      enable = true;
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
	    {
	      action = "Telescope app";
	      desc = " Apps";
	      group = "DiagnosticHint";
	      key = "a";
	    }
	    {
	      action = "Telescope dotfiles";
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

