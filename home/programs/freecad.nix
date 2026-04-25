{pkgs, ...}: let
  freecadThemes = pkgs.fetchFromGitHub {
    owner = "FreeCAD";
    repo = "FreeCAD-themes";
    rev = "master";
    sha256 = "sha256-NxQ6KhUDxB+J5I1pNAwbxAdximzwDCkMHvth+wYMZ0c=";
  };

  freecadPieMenu = pkgs.fetchFromGitHub {
    owner = "Grubuntu";
    repo = "PieMenu";
    rev = "master";
    sha256 = "sha256-PS13eGO5+/KmTK8ZCfzifizEqcN7ktlheN/HkYFyIek=";
  };
in {
  home.packages = with pkgs; [
    freecad
  ];

  # Symlink the addons into FreeCAD's XDG data directory
  xdg.dataFile."FreeCAD/Mod/FreeCAD-themes".source = freecadThemes;
  xdg.dataFile."FreeCAD/Mod/PieMenu".source = freecadPieMenu;
}
