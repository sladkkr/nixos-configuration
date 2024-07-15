{...}: {
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
		xserver.desktopManager.gnome.enable = true;
	};

	home-manager.users.karol.systemd.user = {
		enable = true;
		services = let
			createSyncService = path: {
				Unit.Description = "Keeping ${path} in sync with repository.";
				Install.WantedBy = ["default.target"];
				Service = {
					Type = "oneshot";
					RemainAfterExit = true;
					Environment = "PATH=/run/current-system/sw/bin/";
					ExecStartPre = "/usr/bin/env nm-online -sq";
					ExecStart = "/usr/bin/env bash /home/karol/.local/bin/git-auto-pull ${path}";
					ExecStop = "/usr/bin/env bash /home/karol/.local/bin/git-auto-commit ${path}";
				};
			};
		in {
			sync-notes = createSyncService "/home/karol/repos/notes";
			sync-dotfiles = createSyncService "/home/karol/repos/dotfiles";
			sync-nixos-configuration = createSyncService "/home/karol/repos/nixos-configuration";
			rebuild-nixos-postsync = {
				Unit = {
					Description = "Rebuilds and switches nixos configuration in case changes were made on another machine.";
					Requires = "sync-nixos-configuration.service";
					After = "sync-nixos-configuration.service";
				};
				Install.WantedBy = ["default.target"];
				Service = {
					Type = "oneshot";
					RemainAfterExit = true;
					Environment = "PATH=/run/current-system/sw/bin/";
					ExecStart = "/usr/bin/env sudo /usr/bin/env nixos-rebuild --switch";
				};
			};
		};
	};
}
