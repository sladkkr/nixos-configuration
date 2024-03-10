{pkgs, ...}: {
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
	systemd.user.services."disable-auto-mute" = {
		script = "${pkgs.alsa-utils}/bin/amixer -c 0 sset \"Auto-Mute Mode\" Disabled";
		wantedBy = ["graphical.target"];
		serviceConfig = {
			Type = "oneshot";
		};
	};
	systemd.user.services."nixos-config-sync" = {
		script = "/home/karol/.local/bin/git-auto-commit /home/karol/projekty/nixos-configuration";
		wantedBy = ["graphical.target"];
		serviceConfig = {
			Type = "oneshot";
		};
	};
	systemd.user.services."dotfiles-sync" = {
		script = "/home/karol/.local/bin/git-auto-commit /home/karol/projekty/dotfiles";
		wantedBy = ["graphical.target"];
		serviceConfig = {
			Type = "oneshot";
		};
	};
	systemd.user.timers."nixos-config-sync"= {
		wantedBy = ["timers.target"];
		timerConfig = {
			OnBootSec = "1m";
			OnUnitActiveSec = "1h";
		};
	};
	systemd.user.timers."dotfiles-sync"= {
		wantedBy = ["timers.target"];
		timerConfig = {
			OnBootSec = "1m";
			OnUnitActiveSec = "1h";
		};
	};
}
