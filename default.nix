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
    source_location = pkgs.callPackage ./pkgs/cpp/source_location.nix {};
    
    nn = pkgs.callPackage (import (
      pkgs.fetchFromGitHub {
        owner = "bramtechs";
        repo = "nn";
        rev = "44dcc7964304a159e8a39de29c80e30ff95ae977";
        sha256 = "sha256-3854x7eC8yANW1o49SexBAzRcNai8r0JOeVUdNstzTU=";
      }
    )) { };
    
    touch-scroll-physics-c = pkgs.callPackage (import (
      pkgs.fetchFromGitHub {
        owner = "bramtechs";
        repo = "touch-scroll-physics-c";
        rev = "ba6a56ab5537262ed72ec41a4047023f9a42e1a4";
        sha256 = "sha256-Ns8BH3uQuwoUtY9v2dLA3Ef6OfvqutjWv+QHXJrKddo=";
      }
    )) { };

    smalldeflate-cli = pkgs.callPackage (import (
      pkgs.fetchFromGitHub {
        owner = "bramtechs";
        repo = "smalldeflate-cli";
        rev = "4d30ddd054ebd86c91915345e1bbeeb3968d0c34";
        sha256 = "sha256-5VCJ6uui2za6Obl/6VlDhbLr9CzoQwlnP+nJWEfwg5w=";
      }
    )) { };

  };
in
personal
