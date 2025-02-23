{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    plugins = {
      trim = {
	enable = true;
	settings = {
	  ft_blocklist = [
	    "markdown"
	  ];
	  highlight = false;
	  trim_on_write = true;
	};
      };
    };
  };
}
