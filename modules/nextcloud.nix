{ config, pkgs, ... }:

{
  # 1. Nextcloud Service Configuration
  services.nextcloud = {
    enable = true;
    
    # Use localhost as the hostname for testing
    hostName = "localhost"; 

    # SQLite is the default database when you don't configure one,
    # but we'll explicitly set the config block.
    config = {
      # INSECURE: Storing the password inline for local testing only
      adminuser = "admin";
      adminpass = "testpassword123"; # <-- CHANGE THIS IMMEDIATELY IN PROD!
      
      # Use SQLite, which is the easiest setup but slow for real use.
      dbtype = "sqlite";
    };

    # Enable Redis for better caching, even for local testing
    configureRedis = true;

    # Enable core Nextcloud apps (Photos, Calendar, Contacts)
    extraAppsEnable = true;
    extraApps = with config.services.nextcloud.package.packages.apps; {
      inherit calendar contacts news;
    };
    
    # Set the data directory where files (photos) will be stored
    datadir = "/var/lib/nextcloud/data"; # Default path
  };

  # 2. Webserver & Access Configuration
  # We will use the built-in Nextcloud reverse proxy on a non-standard port 
  # to avoid conflicts, or you can use Nginx/Apache.
  # For the simplest path, we'll use the default setup which often requires Nginx.

  # 2.1. Use Nginx and HTTP (No HTTPS/ACME for local testing)
  services.nginx.enable = true;

  services.nginx.virtualHosts."localhost" = {
    # This automatically configures Nextcloud to run under this host
    locations."/".extraConfig = ''
      proxy_pass http://127.0.0.1:${toString config.services.nextcloud.port};
    '';
  };
  
  # 3. Open Firewall Ports
  # Port 80 is required if you are accessing it via a web browser on the host machine.
  networking.firewall.allowedTCPPorts = [ 80 ]; 
}
