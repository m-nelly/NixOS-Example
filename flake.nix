{
  description = "New Flake!";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      homelab = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/homelab/configuration.nix
	  inputs.home-manager.nixosModules.default
	];
      };
      
      anchor = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
	modules = [
          ./hosts/anchor/configuration.nix
	  inputs.home-manager.nixosModules.default
	];
      };
    };	
  };
}
