{pkgs, ...}: with pkgs; {
	xdg.portal.enable = true;
	programs = {
		git.enable = true;
		steam.enable = true;
		hyprland.enable = true;
		firefox.enable = true;
		nixvim.enable = true;
	};

	fonts.packages = [
		fira-code
		lato
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
					go
					nim
					nimble
					vscode
					flatpak
				];
				games = [
					heroic
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
					dash-to-panel
					blur-my-shell
					noannoyance-fork
					burn-my-windows
					app-hider
					custom-accent-colors
					no-a11y
					night-theme-switcher
					gnome-tweaks
					tiling-assistant
				];
				base = [
					xdg-desktop-portal-gtk
					discord
					htop
					bat
					tldr
					eza
					softmaker-office
					spotify
					telegram-desktop
					unzip
					unrar
				];
			in base ++ games ++ development ++ gnome;

		gnome.excludePackages = with pkgs.gnome; [
			epiphany
			simple-scan
			xterm
		];
	};
}
