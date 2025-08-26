{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    pkgs-unstable.presenterm
    mermaid-cli
  ];

  home.file.".config/presenterm/config.yaml".text = ''
    defaults:
      theme: dark
      image_protocol: kitty-local

    snippet:
      exec:
        enable: true
    mermaid:
      scale: 4
  '';
  home.sessionVariablesExtra = ''
    export PRESENTERM_CONFIG_FILE=$HOME/.config/presenterm/config.yaml
  '';
}
