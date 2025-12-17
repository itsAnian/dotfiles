{ config, pkgs, ... }:

{
  services.nextcloud.package = pkgs.nextcloud31;

  services.nextcloud = {
    enable = true;
    
    hostName = "nixos-server"; 

    config = {
      adminuser = "admin";
      adminpassFile = "/etc/secrets/nextcloud_password";
      dbtype = "sqlite";
    };

    settings.trusted_domains = [
      "nixos-server"
      "192.168.178.24"
      "100.80.132.79"
    ];

    configureRedis = true;

    extraAppsEnable = true;
    extraApps = with config.services.nextcloud.package.packages.apps; {
      inherit calendar contacts news;
    };
    
    datadir = "/var/lib/nextcloud";
  };

  networking.firewall.allowedTCPPorts = [ 80 ]; 
}
