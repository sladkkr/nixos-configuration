{...}: {
	services = {
		pipewire = {
			enable = true;
			wireplumber.enable = true;
			audio.enable = true;
			alsa.enable = true;
			jack.enable = true;
			pulse.enable = true;
		};
		xserver = {
			enable = true;
			displayManager = {
				sddm = {
					enable = true;
					wayland.enable = true;
				};
				defaultSession = "hyprland";
				autoLogin = {
					enable = true;
					user = "karol";
				};
			};
		};
	};
}
