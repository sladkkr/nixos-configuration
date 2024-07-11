with builtins;
{pkgs, ...}:
{
	imports = [
		./system.nix
		./locale.nix
		./packages.nix
		./users.nix
		./networking.nix
		./services.nix
		./program-config.nix
	];
}
