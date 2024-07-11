{pkgs, ...}: with pkgs; {
	xdg.portal.enable = true;
	programs = {
		git.enable = true;
		steam.enable = true;
		firefox.enable = true;
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
					godot_4
					clang-tools
					python3
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
					dash-to-panel
					blur-my-shell
					noannoyance-fork
					app-hider
					custom-accent-colors
					no-a11y
					gnome-tweaks
					tiling-assistant
					weather-or-not
					gnome-boxes
					gnome-disk-utility
				];
				apps = [
					discord
					spotify
					telegram-desktop

				];
				base = [
					xdg-desktop-portal-gtk
					htop
					bat
					tldr
					eza
					unzip
					unrar
					neovim
					vimPlugins.packer-nvim
				];
			in base ++ gnome ++ apps ++ games ++ development;

		gnome.excludePackages = with pkgs.gnome; [
			epiphany
			simple-scan
			xterm
		];
	};
}
