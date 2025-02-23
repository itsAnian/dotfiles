{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    plugins = {
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
    };
  };
}
