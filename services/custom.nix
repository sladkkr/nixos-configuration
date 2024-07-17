{pkgs, config, ...}: {
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
		nixPath = "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
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
			path = [ pkgs.nixos-rebuild ];
			environment.NIX_PATH = nixPath;
			serviceConfig = {
				Type = "oneshot";
				RemainAfterExit = true;
				ExecStart = "/usr/bin/env nixos-rebuild switch";
			};
		};
	};
}
