{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: let
  # openconnect-sso is pinned to a >2-year-old nixpkgs revision (see the
  # nixpkgs-openconnect-sso flake input), which brings in Qt 6.6.1. Its
  # embedded QtWebEngine login browser does a GLX "dummy context" probe on
  # startup that can no longer find a matching FBConfig against the much
  # newer Mesa this system actually runs, and Qt aborts (SIGABRT, core
  # dump) before the login page ever loads. None of the usual overrides
  # (QT_XCB_GL_INTEGRATION, QT_OPENGL=software, LIBGL_ALWAYS_SOFTWARE, ...)
  # change this, since it's the GLX vendor library itself doing the failing
  # FBConfig negotiation. Forcing this one app to load the GLX vendor
  # library from that same old nixpkgs revision it was actually built
  # against (instead of the system's current one) fixes it.
  legacyMesaDrivers = (import inputs.nixpkgs-openconnect-sso {inherit (pkgs) system;}).mesa.drivers;
in {
  home.packages = with pkgs; [
    edu-sync-cli
    pkgs-unstable.obsidian
    openconnect-sso
    ghc # Haskell compiler
    zotero
  ];

  home.shellAliases = {
    dhbw-vpn = "LD_LIBRARY_PATH=${legacyMesaDrivers}/lib LIBGL_DRIVERS_PATH=${legacyMesaDrivers}/lib/dri openconnect-sso --server vpn.dhbw-heidenheim.de --authgroup Studenten+Externe-MFA";
  };
}
