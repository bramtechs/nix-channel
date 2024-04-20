with import <nixpkgs> {};

{
    hello = pkgs.writeShellScriptBin "hello" ''
      echo "Hello from the Nix channel overlay!"
    '';

    pkgs = import sources.nixpkgs {
      overlays = [
        (self: super: {
          inherit hello;
        })
      ];
    };
}
