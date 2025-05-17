{ config, pkgs, pkgs-unstable, inputs, ... }: {
    home.packages = with pkgs; [
        discord
        nil
    ];
}
