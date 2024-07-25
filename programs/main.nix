{...}: {
	imports = [
		./theming.nix
		./firefox.nix
		./steam.nix
		./git.nix
		./nixvim/main.nix
		bash/main.nix
		./flatpak.nix
		./gamemode.nix
	];
}
