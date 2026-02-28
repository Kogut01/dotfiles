{
	description = "Kogut01 Modular Nixos Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations = {
			desktop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./src/dot_nixos/hosts/desktop/default.nix

					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							backupFileExtension = "backup";

							users.kogut01 = import ./src/dot_nixos/users/kogut01.nix;
						};
					}

					# Pin nixpkgs registry to flake input for deterministic `nix shell/run`
					{
						nix.registry.nixpkgs.flake = nixpkgs;
						nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
					}
				];
			};

			server = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./src/dot_nixos/hosts/server/default.nix
				];
			};
		};
	};
}
