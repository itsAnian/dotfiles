{
  ...
}: {
  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "~/dotfiles/home/hyprland/wallpaper/";
        duration = "5m";
        sorting = "random";
        apply-shadow = true;
      };
    };
  };
}
