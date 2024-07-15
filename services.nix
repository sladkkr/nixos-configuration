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

	systemd.services = {
		sync-nixos-configuration = let 
			path = "/home/karol/repos/nixos-configuration";
		in {
			enable = true;
			description = "Keeping /home/karol/repos/nixos-configuration in sync with remote repository.";
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
