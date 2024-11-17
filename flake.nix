{
  description = "Can Ivit's Neovim Config";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      defaultPackage = pkgs.callPackage ./vim.nix { };
    }
  );
}

