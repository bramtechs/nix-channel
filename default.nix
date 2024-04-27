{ pkgs ? import <nixpkgs> {} }:

let
    personal = {
      hello = pkgs.writeShellScriptBin "hello" ''
        echo "Hello from my custom Nix channel!"
      '';
      
      raylib = pkgs.callPackage ./pkgs/raylib { };

      smalldeflate-cli = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/bramtechs/smalldeflate-cli.git";
      })) {};
    };
in
personal
