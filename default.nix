{ }:

let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/63dacb46bf939521bdc93981b4cbb7ecb58427a0.tar.gz";
    sha256 = "sha256:1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
  }) { };
  personal = {
    lunasvg = pkgs.callPackage ./pkgs/cpp/lunasvg.nix { };
    inicpp = pkgs.callPackage ./pkgs/cpp/inicpp.nix { };
    inifile-cpp = pkgs.callPackage ./pkgs/cpp/inifile-cpp.nix { };
    spdlog = pkgs.callPackage ./pkgs/cpp/spdlog.nix { };
    raylib = pkgs.callPackage ./pkgs/cpp/raylib.nix { includeEverything=true; };
    ada-url = pkgs.callPackage ./pkgs/cpp/ada-url.nix {};

    nn = pkgs.callPackage (import (
      builtins.fetchGit { url = "https://github.com/bramtechs/nn.git"; }
    )) { };
    
    touch-scroll-physics-c = pkgs.callPackage (import (
      builtins.fetchGit { url = "https://github.com/bramtechs/touch-scroll-physics-c.git"; }
    )) { };

    smalldeflate-cli = pkgs.callPackage (import (
      builtins.fetchGit { url = "https://github.com/bramtechs/smalldeflate-cli.git"; }
    )) { };

  };
in
personal
