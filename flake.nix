{
  description = "Tyrael Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nur.url = "github:nix-community/NUR";

    sops-nix.url = "github:Mic92/sops-nix";

    # external vim plugins
    plugin-silicon = {
      url = "github:michaelrommel/nvim-silicon";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nur, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {

    nixosConfigurations = {
      tyrael = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./nixos/configuration.nix
          inputs.stylix.nixosModules.stylix
          { nixpkgs.overlays = [ nur.overlay ]; }
          ({ pkgs, ... }:
            let
              nur-no-pkgs = import nur {
                nurpkgs = import nixpkgs { system = "x86_64-linux"; };
              };
            in {
              imports = [ nur-no-pkgs.repos.iopq.modules.xraya  ];
              services.xraya.enable = true;
            })
        ];
      };
    };

    homeConfigurations = {
      tyrael = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./nixosModules/home.nix
          ./nixosModules
          inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
