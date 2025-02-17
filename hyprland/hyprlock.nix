{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [{
	path = "~/dotfiles/hyprland/wallpaper/pexels-sebastiaan9977-1480690.jpg";
	blur_passes = 0;
	contrast = 0.8916;
	brightness = 0.8172;
	vibrancy = 0.1696;
	vibrancy_darkness = 0.0;
      }];

      general = {
	no_fade_in = false;
	grace = 0;
	disable_loading_bar = false;
      };

      label = [
      {
	text = "Welcome!";
	color = "rgba(0, 221, 254, 1.0)";
	font_size = 55;
	font_family = "JetBrainsMono Bold";
	position = "145, 320";
	halign = "left";
	valign = "center";
      }
      {
	text = "cmd[update:1000] echo \"<span>$(date +\"%H:%M\")</span>\"";
	color = "rgba(0, 221, 254, 1.0)";
	font_size = 40;
	font_family = "JetBrainsMono Bold";
	position = "240, 240";
	halign = "left";
	valign = "center";
      }
      {
	text = "cmd[update:1000] echo -e \"$(date +\"%a, %b %d\")\"";
	color = "rgba(0, 221, 254, 1.0)";
	font_size = 19;
	font_family = "JetBrainsMono Bold";
	position = "245, 175";
	halign = "left";
	valign = "center";
      }
      {
	text = "  $USER";
	color = "rgba(0, 0, 0, 1)";
	outline_thickness = 0;
	font_size = 16;
	font_family = "JetBrainsMono Bold";
	position = "275, -140";
	halign = "left";
	valign = "center";
      }
      ];

      image = [{
	path = "~/dotfiles/hyprland/nix_icon_neonblue.png";
	border_size = 0;
	border_color = "rgba(255, 255, 255, .75)";
	size = 95;
	rounding = -1;
	rotate = 0;
	reload_time = -1;
	position = "270, 25";
	halign = "left";
	valign = "center";
      }];

      shape = [{
	size = "320, 55";
	color = "rgba(255, 255, 255, .1)";
	rounding = -1;
	border_size = 1;
	border_color = "rgba(0, 221, 254, 1.0)";
	rotate = 0;
	xray = false;
	position = "160, -140";
	halign = "left";
	valign = "center";
      }];

      input-field = [{
	size = "320, 55";
	outline_thickness = 0;
	dots_size = 0.2;
	dots_spacing = 0.2;
	dots_center = true;
	outer_color = "rgba(0, 221, 254, 1.0)";
	inner_color = "rgba(255, 255, 255, 0.1)";
	font_color = "rgb(200, 200, 200)";
	fade_on_empty = false;
	font_family = "JetBrainsMono Bold";
	placeholder_text = "<i><span foreground=\"##ffffff99\">🔒Enter Pass</span></i>";
	check_color = "rgba(0, 221, 254, 1.0)";
	fail_color = "rgba(204, 34, 34, 0.5)";
	fail_text = "<i>FAILED: <b>($ATTEMPTS)</b></i>";
	capslock_color = "rgba(255, 0, 0, 1.0)";
	numlock_color = "rgba(255, 255, 255, 0.1)";
	hide_input = false;
	position = "160, -220";
	halign = "left";
	valign = "center";
      }];
    };
  };
}
