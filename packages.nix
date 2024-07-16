{pkgs, ...}: with pkgs; {
	xdg.portal.enable = true;
	programs = {
		git.enable = true;
		steam.enable = true;
		firefox.enable = true;
	};

	fonts.packages = [
		fira-code
		inter
	];

	environment = {
		systemPackages = 
			let
				development = [
					rustc
					clippy
					rustfmt
					rust-analyzer
					cargo
					gcc
					godot_4
					clang-tools
					python3
					nil
				];
				games = [
					steam
					bottles
				];
				hyprland = [
					xdg-desktop-portal-hyprland
					playerctl
					pulsemixer
					light
					ulauncher
					mako
					swaybg
					libsForQt5.polkit-kde-agent
					kitty
					thunderbird
				];
				gnome = with pkgs.gnome; with gnomeExtensions; [
					one-window-wonderland
					pkgs.gnome-terminal
					dash-to-panel
					blur-my-shell
					noannoyance-fork
					app-hider
					custom-accent-colors
					no-a11y
					pkgs.gnome-tweaks
					tiling-assistant
					weather-or-not
					gnome-boxes
					pkgs.gnome-disk-utility
					pip-on-top
					quick-settings-audio-panel
					quick-settings-audio-devices-hider
					quick-settings-audio-devices-renamer
				];
				apps = [
					discord
					spotify
					telegram-desktop

				];
				base = [
					xdg-desktop-portal-gtk
					mdadm
					htop
					bat
					tldr
					eza
					unzip
					unrar
					trash-cli
					bash-completion
					hdparm
					wl-clipboard
				];
			in base ++ gnome ++ apps ++ games ++ development;

		gnome.excludePackages = with gnome; [
			pkgs.epiphany
			pkgs.simple-scan
			xterm
			gnome-console
			gnome-maps
			gnome-tour
			gnome-logs
			pkgs.gnome-system-monitor
			gnome-contacts
		];
	};
}
