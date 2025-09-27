{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.niri.homeModules.niri];

  home.packages = with pkgs; [
    fuzzel
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri.overrideAttrs (old: {
      doCheck = false;
    });
    # stylix?

    settings = {
      binds = {
        "Mod+Q".action.spawn = "kitty";
        "Mod+R".action.spawn = "fuzzel";
        "Mod+B".action.spawn = "brave";
        "Mod+C".action.close-window = {};
        "Mod+M".action.quit = {};
      };
    };
  };
}
