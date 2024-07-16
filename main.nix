let
    nixvim = import (builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
    });
in {...}: {
	imports = [
		nixvim.nixosModules.nixvim
		./system.nix
		./locale.nix
		./packages.nix
		./users.nix
		./networking.nix
		./services.nix
		./program-config.nix
	];
}
