{...}: {
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
		grub = {
			device = "nodev";
			useOSProber = true;
		};
	};
}
