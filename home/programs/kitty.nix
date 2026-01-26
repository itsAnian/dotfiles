{
  pkgs,
  host,
  ...
}: {
  programs.kitty = {
    enable = true;

    settings = {
      term = "xterm-256color";
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = "no";

      font_size =
        if host == "nixos-laptop"
        then 12
        else 10;
      cursor_trail = 0;

      background_opacity = "0.7";
      background_blur = 100;

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      tab_separator = " | ";
      tab_activity_symbol = "none";
      tab_title_max_length = 15;
      tab_title_template = "{index}:{title}";
      tab_powerline_style = "slanted";
      active_tab_title_template = "none";
      active_tab_foreground = "#d3c6aa";
      active_tab_background = "#5c6a72";
      active_tab_font_style = "bold";
      inactive_tab_foreground = "#a7c080";
      inactive_tab_background = "#2d353b";
      inactive_tab_font_style = "normal";
    };

    keybindings = {
      "shift+super+n" = "new_tab";
      "shift+super+p" = "close_tab";
      "shift+super+j" = "next_tab";
      "shift+super+k" = "previous_tab";
    };

    extraConfig = ''
      map ctrl+l clear_terminal scroll active
    '';
  };

  home.packages = with pkgs; [
    jetbrains-mono
  ];
}
