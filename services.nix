{pkgs, ...}: {
	hardware.pulseaudio.enable = false;
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
				defaultSession = "gnome";
				autoLogin = {
					enable = true;
					user = "karol";
				};
			};
			desktopManager.gnome.enable = true;
		};
	};
	# systemd.user.services."disable-auto-mute" = {
	# 	wantedBy = ["graphical.target"];
	# 	serviceConfig = {
	# 		ExecStart = "${pkgs.alsa-utils}/bin/amixer -c 0 sset \"Auto-Mute Mode\" Disabled";
	# 	};
	# };
	# systemd.user.services."nixos-config-sync" = {
	# 	wantedBy = ["graphical.target"];
	# 	serviceConfig = {
	# 		ExecStart = "cd /home/karol/projekty/nixos-configuration && ${pkgs.git}/bin/git fetch && ${pkgs.git}/bin/git pull | tr -d ' ' | xargs test Jużaktualne. != && ${pkgs.sudo}/bin/sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch && ${pkgs.libnotify}/bin/notify-send 'NixOs aktualny z repozytorium git'"; 
	# 		ExecStop = "${pkgs.bash}/bin/bash /home/karol/.local/bin/git-auto-commit /home/karol/projekty/nixos-configuration";
	# 		RemainAfterExit = "yes";
	# 	};
	# };
	# systemd.user.services."dotfiles-sync" = {
	# 	wantedBy = ["graphical.target"];
	# 	serviceConfig = {
	# 		ExecStart = "cd /home/karol/projekty/dotfiles && ${pkgs.git}/bin/git fetch && ${pkgs.git}/bin/git pull";
	# 		ExecStop = "${pkgs.bash}/bin/bash /home/karol/.local/bin/git-auto-commit /home/karol/projekty/dotfiles";
	# 		RemainAfterExit = "yes";
	# 	};
	# };
}
