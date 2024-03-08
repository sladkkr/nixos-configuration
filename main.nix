with builtins;
{pkgs, ...}:
let
	nixvim = import (fetchGit {
		url = "https://github.com/nix-community/nixvim";
		ref = "nixos-23.05";
	});

	hostname = getEnv "HOSTNAME";
in
{
	imports = [
		nixvim.nixosModules.nixvim
		./system.nix
		./locale.nix
		./packages.nix
		./users.nix
		./networking.nix
		./services.nix
		./program-config.nix
		./${hostname}.nix
	];
}
