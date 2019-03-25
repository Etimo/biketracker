{
  useDocker ? false,

  pkgsOpts ?
    if useDocker
      then { system = "x86_64-linux"; }
      else {},
  pkgsBootstrap ? import <nixpkgs> {},
  pkgsSrc ? pkgsBootstrap.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs-channels";
    # branch = "nixpkgs-unstable";
    rev = "796a8764ab85746f916e2cc8f6a9a5fc6d4d03ac";
    sha256 = "1m57gsr9r96gip2wdvdzbkj8zxf47rg3lrz35yi352x1mzj3by3x";
  },
}: rec {
  pkgs = import pkgsSrc pkgsOpts;

  cargoPkgs = pkgs.callPackage ./Cargo.nix {
    cratesIO = pkgs.callPackage ./crates-io.nix {};
  };
}
