{...}: {
	boot.loader = {
		systemd-boot.enable = true;
  		efi.canTouchEfiVariables = true;
		grub = {
			device = "nodev";
			useOSProber = true;
		};
	};

	security.sudo.wheelNeedsPassword = false;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = "nix-command flakes";

	system.stateVersion = "24.05";

	home-manager.useGlobalPkgs = true;
}
