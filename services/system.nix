{...}: {
	hardware.pulseaudio.enable = false;
	networking.networkmanager.enable = true;
	virtualisation.libvirtd.enable = true;
	nix = {
		gc.automatic = true;
		settings.auto-optimise-store = true;
	};
	services = {
		pipewire = {
			enable = true;
			wireplumber.enable = true;
			audio.enable = true;
			alsa.enable = true;
			jack.enable = true;
			pulse.enable = true;
		};
		displayManager = {
			sddm.enable = true;
			defaultSession = "gnome";
			autoLogin = {
				enable = true;
				user = "karol";
			};
		};
		xserver = {
			enable = true;
			desktopManager = {
				xfce.enable = true;
				gnome.enable = true;
				#plasma6.enable = true;
			};
		};
	};
}
