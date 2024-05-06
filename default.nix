{ pkgs ? import <nixpkgs> {} }:

let
    personal = {
      hello = pkgs.writeShellScriptBin "hello" ''
        echo "Hello from my custom Nix channel!"
      '';
      
      raylib = pkgs.callPackage ./pkgs/raylib { };

      python = {
        tf-keras = pkgs.callPackage ./pkgs/python/tf-keras { };
        tensorflow-decision-forests = pkgs.callPackage ./pkgs/python/tensorflow-decision-forests { };
        
        tensorflowjs = pkgs.callPackage ./pkgs/python/tensorflowjs {
          tf-keras = personal.python.tf-keras;
          tensorflow-decision-forests = personal.python.tensorflow-decision-forests;
        };
      };
      
      smalldeflate-cli = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/bramtechs/smalldeflate-cli.git";
      })) {};
    };
in
personal
