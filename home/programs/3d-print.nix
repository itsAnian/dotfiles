{
  config,
  pkgs,
  ...
}: let
  orca-overlay = final: prev: {
    orca-slicer = prev.orca-slicer.overrideAttrs (old: let
      makeWrapper = final.makeWrapper;
    in {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [makeWrapper];

      postInstall =
        (old.postInstall or "")
        + ''
          wrapProgram $out/bin/orca-slicer \
            --set __GLX_VENDOR_LIBRARY_NAME mesa \
            --set __EGL_VENDOR_LIBRARY_FILENAMES /run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json \
            --set MESA_LOADER_DRIVER_OVERRIDE zink \
            --set GALLIUM_DRIVER zink \
            --set WEBKIT_DISABLE_DMABUF_RENDERER 1
        '';
    });
  };
in {
  nixpkgs.overlays = [orca-overlay];

  home.packages = [
    pkgs.orca-slicer
  ];

  home.file.".local/bin/orca-slicer".text = ''
    #!/bin/sh
    env \
      __GLX_VENDOR_LIBRARY_NAME=mesa \
      __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json \
      MESA_LOADER_DRIVER_OVERRIDE=zink \
      GALLIUM_DRIVER=zink \
      WEBKIT_DISABLE_DMABUF_RENDERER=1 \
      /etc/profiles/per-user/anian/bin/orca-slicer "$@"
  '';

  home.file.".local/bin/orca-slicer".executable = true;
}
