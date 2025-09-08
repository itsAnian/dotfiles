{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim

    # lsps
    lua-language-server
    nil
    pyright

    # formatter
    alejandra
  ];

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
