{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.cargo pkgs.dbus pkgs.pkgconfig
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.xorg.libX11 pkgs.xorg.libXcursor pkgs.xorg.libXrandr pkgs.xorg.libXi pkgs.libglvnd pkgs.mesa.drivers
  ];
}
