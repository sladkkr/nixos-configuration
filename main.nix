{...}:
with builtins;
let homeManager = fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz"; in
{
	imports = [
		(import "${homeManager}/nixos")
		./system.nix
		./locale.nix
		./packages.nix
		./users.nix
		./networking.nix
		./services.nix
		./program-config.nix
	];
}
