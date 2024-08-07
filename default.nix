{ }:

let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz";
    sha256 = "sha256:0r9a5p748wj5lkpipy6r03d0lqzyv56krcf26l1367xg4nafn95c";
  }) { };
  personal = {
    lunasvg = pkgs.callPackage ./pkgs/cpp/lunasvg.nix { };
    inicpp = pkgs.callPackage ./pkgs/cpp/inicpp.nix { };
    inifile-cpp = pkgs.callPackage ./pkgs/cpp/inifile-cpp.nix { };
    spdlog = pkgs.callPackage ./pkgs/cpp/spdlog.nix { };
    raylib = pkgs.callPackage ./pkgs/cpp/raylib.nix { includeEverything=true; };

    touch-scroll-physics-c = pkgs.callPackage (import (
      builtins.fetchGit { url = "https://github.com/bramtechs/touch-scroll-physics-c.git"; }
    )) { };

    smalldeflate-cli = pkgs.callPackage (import (
      builtins.fetchGit { url = "https://github.com/bramtechs/smalldeflate-cli.git"; }
    )) { };

  };
in
personal
