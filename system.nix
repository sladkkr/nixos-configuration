{config, ...}: {
	boot.loader = {
		systemd-boot.enable = true;
  		efi.canTouchEfiVariables = true;
	};

	security.sudo.wheelNeedsPassword = false;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = "nix-command flakes";

	system.stateVersion = "24.05";
}
