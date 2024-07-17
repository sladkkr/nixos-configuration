let
    nixvim = import (builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
    });
in {...}: {
	imports = [
		nixvim.nixosModules.nixvim
		./system.nix
		./boot.nix
		./locale.nix
		./users.nix
		./packages/main.nix
		./services/main.nix
		./program-config/main.nix
	];
}
