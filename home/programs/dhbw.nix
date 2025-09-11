{pkgs, pkgs-unstable, ...}: {
  home.packages = with pkgs; [
    edu-sync-cli
    pkgs-unstable.obsidian
    openconnect-sso

    mqtt-explorer
    redisinsight
  ];

  home.shellAliases = {
    dhbw-vpn = "openconnect-sso --server vpn.dhbw-heidenheim.de --authgroup Studenten+Externe-MFA";
  };
}
