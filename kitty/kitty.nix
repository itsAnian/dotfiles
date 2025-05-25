{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      font_size = 14;
      cursor_trail = 0;

      background_opacity = "0.7";
      background_blur = 100;

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      tab_separator = " ┇";
      tab_activity_symbol = "none";
      tab_title_max_length = 15;
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}{title}";
      active_tab_title_template = "none";
      active_tab_foreground = "#080808";
      active_tab_background = "#33ccff";
      active_tab_font_style = "bold-italic";
      inactive_tab_foreground = "#080808";
      inactive_tab_background = "#ffffff";
      inactive_tab_font_style = "normal";
      tab_bar_background = "none";
    };

    keybindings = {
      "ctrl+alt+n" = "new_tab";
      "ctrl+alt+#" = "close_tab";
      "ctrl+alt+j" = "next_tab";
      "ctrl+alt+k" = "previous_tab";
    };

    extraConfig = ''include themes/Cattpuccin.conf'';
  };

  home.file.".config/kitty/themes" = {
    source = ./themes;
    recursive = true;
  };

  home.packages = with pkgs; [
    jetbrains-mono # Ensure the font is installed
  ];
}
