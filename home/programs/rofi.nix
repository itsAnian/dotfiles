{
  pkgs,
  config,
  ...
}: let
  # Define mkLiteral outside of the theme block
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,run";
      show-icons = true;
      font = "CaskaydiaCove Nerd Font 18";
      display-drun = "Apps";
      display-run = "Run";
    };

    theme = {
      "*" = {
        # Define color variables for easy customization
        bg-col = mkLiteral "#343F44";
        bg-col-light = mkLiteral "#475258";
        border-col = mkLiteral "#a7c080";
        selected-col = mkLiteral "#475258";
        blue = mkLiteral "#ffffff";
        fg-col = mkLiteral "#ffffff";
        fg-col2 = mkLiteral "#ffffff";
        grey = mkLiteral "#ffffff";

        width = mkLiteral "600";
        font = "JetBrainsMono Nerd Font 18"; # Custom font
      };

      "element-text, element-icon , mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "380px";
        border = mkLiteral "3px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = mkLiteral "[prompt,entry]";
        background-color = mkLiteral "@bg-col";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = mkLiteral "false";
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = "mkLiteral 2";
        lines = "mkLiteral 5";
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        margin = mkLiteral "0px 20px 0px 0px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col  ";
        border-radius = mkLiteral "10px";
      };

      "element-icon" = {
        margin = mkLiteral "0px 0px 0px 10px";
        size = mkLiteral "25px";
      };

      "element-text" = {
        margin = mkLiteral "0px 0px 0px 10px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@fg-col2  ";
      };

      "mode-switcher" = {
        spacing = mkLiteral "0";
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
  };
}
