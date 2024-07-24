{...}: {
	programs.bash = {
		shellAliases = import ./aliases.nix;
		promptInit = import ./init.nix;
	};
}
