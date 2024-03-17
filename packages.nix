{pkgs, ...}: {
	xdg.portal.enable = true;
	programs = {
		git.enable = true;
		steam.enable = true;
		hyprland.enable = true;
		firefox.enable = true;
		thunar.enable = true;
		nixvim.enable = true;
	};

	fonts.packages = with pkgs; [
		fira-code
		lato
	];

	environment.systemPackages = with pkgs; [
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		discord
		htop
		bat
		tldr
		eza
		softmaker-office
		transmission
		playerctl
		pulsemixer
		light
		ncspot
		telegram-desktop
		bottles
		heroic
		ulauncher
		mako
		kitty
		thunderbird
		unzip
		unrar
		rustc
		clippy
		rustfmt
		rust-analyzer
		cargo
		gcc
		swaybg
		libsForQt5.polkit-kde-agent
	];
}
