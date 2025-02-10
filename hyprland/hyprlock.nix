{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
  ];

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
	disable_loading_bar = true;
	grace = 300;
	hide_cursor = true;
	no_fade_in = false;
      };

      background = [
      {
	path = "screenshot";
	blur_passes = 3;
	blur_size = 8;
      }
      ];

      label = [
      {
	text = "Hello";
#          color = "rgba(${hexToRgb colours.text}, 1.0)";
#          font_family = theme.fonts.default.name;
	font_size = 64;
	text_align = "center";
	halign = "center";
	valign = "center";
	position = "0, 160";
      }
      {
	text = "$TIME";
#          color = "rgba(${hexToRgb colours.subtext1}, 1.0)";
#          font_family = theme.fonts.default.name;
	font_size = 32;
	text_align = "center";
	halign = "center";
	valign = "center";
	position = "0, 75";
      }
      ];

      input-field = [
      {
	size = "200, 50";
	position = "0, -80";
	monitor = "";
	dots_center = true;
	fade_on_empty = false;
	font_color = "rgb(202, 211, 245)";
	inner_color = "rgb(91, 96, 120)";
	outer_color = "rgb(24, 25, 38)";
	outline_thickness = 5;
	shadow_passes = 2;
	placeholder_text = "";
      }
      ];
    };
  };
}
