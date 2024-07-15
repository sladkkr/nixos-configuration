{pkgs, config, ...}: {
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

	systemd.services = let 
		createSyncService = path: {
			enable = true;
			description = "Keeping ${path} in sync with remote repository.";
			wantedBy = ["default.target"];
			wants = ["NetworkManager-wait-online.service"];
			after = ["NetworkManager-wait-online.service"];
			path = with pkgs; [bash git openssh ];
			serviceConfig = {
				Type = "oneshot";
				RemainAfterExit = true;
				User = "karol";
				Group = "users";
				ExecStart = "/usr/bin/env bash /home/karol/.local/bin/git-auto-pull ${path}";
				ExecStop = "/usr/bin/env bash /home/karol/.local/bin/git-auto-commit ${path}";
			};
		};
	in {
		sync-nixos-configuration = createSyncService "/home/karol/repos/nixos-configuration";
		sync-dotfiles = createSyncService "/home/karol/repos/dotfiles";
		sync-notes = createSyncService "/home/karol/repos/notes";
		nixos-rebuild = {
			enable = true;
			description = "Rebuild and switch nixos configuration in case it was changed on another machine";
			wantedBy = ["default.service"];
			wants = [ config.systemd.services.sync-nixos-configuration.name ];
			after = [ config.systemd.services.sync-nixos-configuration.name ];
			path = with pkgs; [ nixos-rebuild ];
			serviceConfig = {
				Type = "oneshot";
				RemainAfterExit = true;
				ExecStart = "/usr/bin/env nixos-rebuild switch";
			};
		};
	};



	# home-manager.users.karol.systemd.user = {
	# 	enable = true;
	# 	services = let
	# 		createSyncService = path: {
	# 			Unit.Description = "Keeping ${path} in sync with repository.";
	# 			Install.WantedBy = ["default.target"];
	# 			Service = {
	# 				Type = "oneshot";
	# 				RemainAfterExit = true;
	# 				Environment = "PATH=/run/current-system/sw/bin/";
	# 				ExecStartPre = "/usr/bin/env nm-online -sq";
	# 				ExecStart = "/usr/bin/env bash /home/karol/.local/bin/git-auto-pull ${path}";
	# 				ExecStop = "/usr/bin/env bash /home/karol/.local/bin/git-auto-commit ${path}";
	# 			};
	# 		};
	# 	in {
	# 		sync-notes = createSyncService "/home/karol/repos/notes";
	# 		sync-dotfiles = createSyncService "/home/karol/repos/dotfiles";
	# 		sync-nixos-configuration = let path = "/home/karol/repos/nixos-configuration"; in {
	# 			Unit.Description = "Keeping ${path} in sync with repository.";
	# 			Install.WantedBy = ["default.target"];
	# 			Service = {
	# 				Type = "oneshot";
	# 				RemainAfterExit = true;
	# 				Environment = "PATH=/run/current-system/sw/bin/";
	# 				ExecStartPre = "/usr/bin/env nm-online -sq";
	# 				ExecStart = "/usr/bin/env bash /home/karol/.local/bin/git-auto-pull ${path}";
	# 				ExecStartPost = "/usr/bin/env touch /tmp/karol-sync-nixos-configuration-finished";
	# 				ExecStop = "/usr/bin/env bash /home/karol/.local/bin/git-auto-commit ${path}";
	# 			};
	# 			
	# 		};
	# 	};
	# };
}
