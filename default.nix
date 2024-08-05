{ pkgs ? import <nixpkgs> {} }:

let
    personal = {
      raylib = pkgs.callPackage ./pkgs/cpp/raylib.nix { };
      lunasvg = pkgs.callPackage ./pkgs/cpp/lunasvg.nix { };
      inicpp = pkgs.callPackage ./pkgs/cpp/inicpp.nix { };
      touch-scroll-physics-c = pkgs.callPackage ./pkgs/cpp/touch-scroll-physics-c.nix { };

      smalldeflate-cli = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/bramtechs/smalldeflate-cli.git";
      })) {};
    };
in
personal
