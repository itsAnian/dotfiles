{inputs, ...}: {
  programs.termstat = {
    enable = false;
    enableBashIntegration = true;
    systemd = {
      enable = true;
      onCalendar = "*:0/15";
    };
  };

  imports = [
    inputs.termstat.homeManagerModules.default
  ];
}
