{ sources ? import <nixpkgs> {} }:

let
  pkgs = sources.pkgs;

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Hello from the Nix channel overlay!"
  '';

  overlay = self: super: {
    inherit hello;
  };
in pkgs
