{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    hypridle
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Verhindert mehrere Instanzen von hyprlock
        before_sleep_cmd = "hyprlock --immediate"; # Sperrt den Bildschirm vor dem Suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Vermeidet doppeltes Drücken zum Aktivieren des Displays
      };

      listener = [
        {
          timeout = 280;
          on-timeout = "brightnessctl -s set 10"; # Bildschirmhelligkeit minimieren (nicht 0 bei OLED)
          on-resume = "brightnessctl -r"; # Bildschirmhelligkeit wiederherstellen
        }
        {
          timeout = 300;
          on-timeout = "hyprlock --immediate"; # Sperrt den Bildschirm nach 5 Min.
        }
        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off"; # Bildschirm aus nach 5,5 Min.
          on-resume = "hyprctl dispatch dpms on"; # Bildschirm an bei Aktivität
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend"; # Suspend nach 30 Min.
        }
      ];
    };
  };
  systemd.user.services.hypridle.Install.WantedBy = lib.mkForce [];
}
