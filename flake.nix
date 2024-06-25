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

    # external vim plugins
    plugin-silicon = {
      url = "github:michaelrommel/nvim-silicon";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
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
      inherit inputs;

      modules = [ 
        ./nixos/configuration.nix
        inputs.stylix.nixosModules.stylix
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
