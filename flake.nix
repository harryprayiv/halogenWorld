{
  inputs = {
    purs-nix.url = "github:cardanonix/purs-nix/ps-0.15";
    nixpkgs.follows = "purs-nix/nixpkgs";
    utils.url = "github:ursi/flake-utils";
    ps-tools.follows = "purs-nix/ps-tools";
    npmlock2nix = { 
      flake = false;
      url = "github:nix-community/npmlock2nix";
    };
  };

  outputs = { self, utils, nixpkgs, ... }@inputs:
    let
      systems = [ "x86_64-linux" ];
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      npmlock2nix = (import inputs.npmlock2nix { inherit pkgs; }).v1;
    in
    utils.apply-systems
      { inherit inputs systems; }
      ({ system, pkgs, ... }:
        let
          purs-nix = inputs.purs-nix { inherit system; };
          ps = purs-nix.purs
            {
              # Project dir (src, test)
              dir = ./.;
              # Dependencies
              dependencies =
                with purs-nix.ps-pkgs;
                [
                  prelude
                  console
                  effect
                  halogen
                  web-html
                ];
              # FFI dependencies
              # foreign.Foreign.JSON.node_modules = with purs-nix.ps-pkgs; [ foreign-generic ];
            };
          ps-tools = inputs.ps-tools.legacyPackages.${system};
          ps-command = ps.command { };
        in
        {
          # packages.default = ps.output { };
          packages  = with ps; { 
            default = app { name = "halogenWorld"; };
            bundle  = bundle {};
            output  = output {};
          };

          devShells.default =
            pkgs.mkShell
              {
                packages =
                  with pkgs;
                  [
                    ps-command
                    ps-tools.for-0_15.purescript-language-server
                    purs-nix.esbuild
                    purs-nix.purescript
                    nodejs
                    spago
                    yarn2nix
                  ];
              };
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://klarkc.cachix.org?priority=99"
      "https://cache.iog.io"
      "https://cache.zw3rk.com"
      "https://cache.nixos.org"
      "https://hercules-ci.cachix.org"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
    ];
  };
}