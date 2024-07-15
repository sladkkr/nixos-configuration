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

	systemd.services.testing-inotifywait = {
		description = "Testing inotifywait";
		serviceConfig = {
			Type = "oneshot";
			RemainAfterExit = true;
			ExecStart = pkgs.writeShellScript "testing-inotifywait.sh" ''
				${pkgs.inotify-tools}/bin/inotifywait  -e create,moved_to,attrib --include '/karol-sync-nixos-configuration-finished$' -qq /tmp && \
				mv /tmp/karol-sync-nixos-configuration-finished /tmp/systemd-finished
			'';
		};
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
			sync-nixos-configuration = let path = "/home/karol/repos/nixos-configuration"; in {
				Unit.Description = "Keeping ${path} in sync with repository.";
				Install.WantedBy = ["default.target"];
				Service = {
					Type = "oneshot";
					RemainAfterExit = true;
					Environment = "PATH=/run/current-system/sw/bin/";
					ExecStartPre = "/usr/bin/env nm-online -sq";
					ExecStart = "/usr/bin/env bash /home/karol/.local/bin/git-auto-pull ${path}";
					ExecStartPost = "/usr/bin/env touch /tmp/karol-sync-nixos-configuration-finished";
					ExecStop = "/usr/bin/env bash /home/karol/.local/bin/git-auto-commit ${path}";
				};
				
			};
		};
	};
}
