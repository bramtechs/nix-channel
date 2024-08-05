{ pkgs ? import <nixpkgs> {} }:

let
    personal = {
      lunasvg = pkgs.callPackage ./pkgs/cpp/lunasvg.nix { };
      inicpp = pkgs.callPackage ./pkgs/cpp/inicpp.nix { };
      inifile-cpp = pkgs.callPackage ./pkgs/cpp/inifile-cpp.nix { };

      touch-scroll-physics-c = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/bramtechs/touch-scroll-physics-c.git";
      })) {};

      smalldeflate-cli = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/bramtechs/smalldeflate-cli.git";
      })) {};

    };
in
personal
