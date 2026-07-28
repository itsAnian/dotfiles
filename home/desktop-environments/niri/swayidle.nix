{
  config,
  pkgs,
  ...
}: {
  services.swayidle = let
    lock = "${config.programs.noctalia-shell.package}/bin/noctalia-shell ipc call lockScreen lock";
  in {
    enable = true;
    systemdTarget = ["graphical-session.target"];

    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 30 seconds' -t 30";
      }
      {
        timeout = 330;
        command = lock;
      }
    ];

    events = {
      before-sleep = lock;
      lock = lock;
    };
  };
}
