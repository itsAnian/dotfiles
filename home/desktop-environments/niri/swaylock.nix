{pkgs, ...}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      color = "#000000"; # main background = black
      indicator-radius = 100; # radius of the unlock circle
      inside-color = "#000000"; # inside circle = black (blend with background)
      inside-wrong-color = "#fc0303"; # red if wrong password
      ring-color = "#ffffff"; # ring = white
      ring-ver-color = "#ffffff"; # ring while verifying = white
      ring-wrong-color = "#fc0303"; # red for wrong input
      key-hl-color = "#ffffff"; # highlight pressed keys = white
      text-ver-color = "#ffffff"; # verifying text = white
      text-wrong-color = "#fc0303"; # wrong password text = red
      text-clear = "Reset"; # optional
      text-caps-lock = "CAPS LOCK"; # caps lock indicator
      text-ver = "Verifying"; # verification message
      text-wrong = "Access Denied"; # wrong password message
      indicator-thickness = 6; # ring thickness
      effect = "none"; # no fancy effects
    };
  };
  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    events = [
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
    timeouts = [
      {
        timeout = 30;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };
}
