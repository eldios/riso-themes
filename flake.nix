{
  description = "riso-themes - the riso theme catalog and its gallery";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # the gallery
            zola

            # CI parity: index validation and workflow dry-runs
            jq
            git
            actionlint
            act

            # task runner
            just
          ];
        };
      });
}
