{...}: {
	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			device = "nodev";
			useOSProber = true;
		};
	};
}
