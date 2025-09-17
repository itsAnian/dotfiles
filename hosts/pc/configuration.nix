# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = ["nodev"];
    efiSupport = true;
    useOSProber = true;
  };
  boot.loader.grub2-theme = {
    enable = true;
    theme = "stylish";
    footer = true;
  };

  imports = [
    ../../modules/nix-ld.nix
    ./nvidia.nix
  ];

  # Gaming
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = false;
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    gamescope
    kdePackages.kcalc
    lutris
  ];

  nixpkgs.overlays = [
    (self: super: {
      lutris = super.lutris.override {
        extraLibraries = pkgs:
          with pkgs; [
            # 64-bit libraries
            keyutils
            libkrb5
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc
            vulkan-loader
            xorg.libXcomposite
            xorg.libXext
            xorg.libX11
            xorg.libXau
            xorg.libxcb
            xorg.libXdmcp
            xorg.libXfixes
            xorg.libXrandr
            xorg.libXrender
            xorg.libXxf86vm
            xorg.libxshmfence

            # 32-bit libraries
            pkgsi686Linux.keyutils
            pkgsi686Linux.libkrb5
            pkgsi686Linux.libpng
            pkgsi686Linux.libpulseaudio
            pkgsi686Linux.libvorbis
            pkgsi686Linux.stdenv.cc.cc
            pkgsi686Linux.vulkan-loader
            pkgsi686Linux.xorg.libXcomposite
            pkgsi686Linux.xorg.libXext
            pkgsi686Linux.xorg.libX11
            pkgsi686Linux.xorg.libXau
            pkgsi686Linux.xorg.libxcb
            pkgsi686Linux.xorg.libXdmcp
            pkgsi686Linux.xorg.libXfixes
            pkgsi686Linux.xorg.libXrandr
            pkgsi686Linux.xorg.libXrender
            pkgsi686Linux.xorg.libXxf86vm
            pkgsi686Linux.xorg.libxshmfence

            # GStreamer and its plugins (both 64 and 32-bit)
            gst_all_1.gstreamer
            gst_all_1.gst-plugins-base
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-libav

            pkgsi686Linux.gst_all_1.gstreamer
            pkgsi686Linux.gst_all_1.gst-plugins-base
            pkgsi686Linux.gst_all_1.gst-plugins-good
            pkgsi686Linux.gst_all_1.gst-plugins-bad
            pkgsi686Linux.gst_all_1.gst-plugins-ugly
            pkgsi686Linux.gst_all_1.gst-libav

            # Specific libraries mentioned in your errors
            pkgsi686Linux.libgudev # fixes "libgudev-1.0.so.0" error
            pkgsi686Linux.speex # fixes "libspeex.so.1" error
            pkgsi686Linux.libtheora # fixes "libtheoradec.so.1" error
            pkgsi686Linux.openal # fixes "libopenal.so.1" error
            pkgsi686Linux.libvdpau # fixes "libvdpau.so.1" error
          ];
      };
    })
  ];

  networking.hostName = "nixos-pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anian = {
    isNormalUser = true;
    description = "anian";
    extraGroups = ["networkmanager" "wheel" "docker" "dialout" "tty"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.zsh.enable = true;

  #docker
  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
