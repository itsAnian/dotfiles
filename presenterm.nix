{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    pkgs-unstable.presenterm
  ];

  home.file.".config/presenterm/config.yaml".text = ''
    defaults:
      theme: dark
      image_protocol: kitty-local

    snippet:
      exec:
        enable: true
  '';
  home.sessionVariablesExtra = ''
    export PRESENTERM_CONFIG_FILE=$HOME/.config/presenterm/config.yaml
  '';
}
