{ pkgs ? import <nixpkgs> {} }:

let
    personal = {
      hello = pkgs.writeShellScriptBin "hello" ''
        echo "Hello from my custom Nix channel!"
      '';
    };
in
personal
