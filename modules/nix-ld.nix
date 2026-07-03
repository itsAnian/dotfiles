{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    glfw
    openssl
    glibc
    libGL
    libxkbcommon
    libX11
    libXcursor
    libXrandr
    libXi
    libXxf86vm
    wayland
    vulkan-tools
    vulkan-loader
  ];
}
