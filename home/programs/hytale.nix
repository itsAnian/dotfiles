{pkgs, ...}: {
  home.packages = with pkgs; [
    (symlinkJoin {
      name = "hytale-launcher";
      paths = [hytale-launcher]; # Ensure this variable matches your input package
      buildInputs = [makeWrapper];
      postBuild = ''
        # 1. FIX THE BINARY
        # Remove the symlink to the original read-only binary
        rm $out/bin/hytale-launcher

        # Create a new wrapper that calls the original binary with your flag
        makeWrapper ${hytale-launcher}/bin/hytale-launcher $out/bin/hytale-launcher \
          --set WEBKIT_DISABLE_DMABUF_RENDERER 1

        # 2. FIX THE DESKTOP SHORTCUT
        # Remove the symlink to the original desktop file
        rm $out/share/applications/hytale-launcher.desktop

        # Copy the original file here so we can edit it (cp resolves symlinks)
        cp ${hytale-launcher}/share/applications/hytale-launcher.desktop $out/share/applications/

        # Force the desktop file to use OUR new wrapper ($out) instead of the old path
        sed -i "s|^Exec=.*|Exec=$out/bin/hytale-launcher|" $out/share/applications/hytale-launcher.desktop
      '';
    })
  ];
}
