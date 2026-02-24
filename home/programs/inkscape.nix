{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    (pkgs.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs-unstable.inkscape-extensions; [
        silhouette
        inkstitch
      ];
    })
    python313Packages.matplotlib
  ];
  xdg.configFile."matplotlib/matplotlibrc".text = ''
    backend: TkAgg
  '';
}
