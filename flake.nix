{
  description = "Tyrael Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # external vim plugins
    plugin-silicon.url = "github:michaelrommel/nvim-silicon";
    plugin-silicon.flake = false;
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
      inherit system;

      modules = [ ./nixos/configuration.nix ];
    };
  };

  homeConfigurations = {
    tyrael = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./nixosModules/home.nix
        ./nixosModules
      ];

      extraSpecialArgs = { inherit inputs; };
    };
  };

  };
}
