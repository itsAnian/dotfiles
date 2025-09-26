{pkgs, ...}: let
  lsp = builtins.readFile ./lsp.lua;
  opt = builtins.readFile ./opt.lua;
  lualine = builtins.readFile ./lualine.lua;
  which-key = builtins.readFile ./which-key.lua;
  cmp = builtins.readFile ./cmp.lua;
  map = builtins.readFile ./map.lua;
  nvim-tree = builtins.readFile ./nvim-tree.lua;
  colorizer = builtins.readFile ./colorizer.lua;
  snacks = builtins.readFile ./snacks.lua;
  markdown-preview = builtins.readFile ./markdown-preview.lua;
  telescope = builtins.readFile ./telescope.lua;
  treesitter = builtins.readFile ./treesitter.lua;
  hlchunk = builtins.readFile ./hlchunk.lua;
  diagnostics = builtins.readFile ./diagnostics.lua;
  vimtex = builtins.readFile ./vimtex.lua;
  windsurf = builtins.readFile ./windsurf-nvim.lua;
in {
  home.packages = with pkgs; [
    # lsps
    lua-language-server
    nil
    pyright

    # formatter
    alejandra
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      monokai-pro-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      crates-nvim
      hlchunk-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      # mini-nvim
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      fidget-nvim
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      telescope-fzf-native-nvim
      telescope-nvim
      tokyonight-nvim
      which-key-nvim
      snacks-nvim
      mini-icons
      windsurf-nvim
      vim-wakatime
    ];

    extraLuaConfig = ''
      vim.cmd.colorscheme("monokai-pro")
      ${opt}
      ${lualine}
      ${which-key}
      ${lsp}
      ${cmp}
      ${map}
      ${nvim-tree}
      ${colorizer}
      ${snacks}
      ${markdown-preview}
      ${telescope}
      ${treesitter}
      ${hlchunk}
      ${diagnostics}
      ${vimtex}
      ${windsurf}
    '';
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
