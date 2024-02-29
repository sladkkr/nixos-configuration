{pkgs, ...}: {
	programs = {
		git.enable = true;
		steam.enable = true;
		hyprland.enable = true;
		firefox.enable = true;
	};

	fonts.packages = with pkgs; [
		fira-code
		lato
	];

	environment.systemPackages = with pkgs; [
		playerctl
		pulsemixer
		nodejs_20
		ncspot
		telegram-desktop
		bottles
		heroic
		ulauncher
		mako
		kitty
		thunderbird
		clang-tools
		unzip
		unrar
		python3
		clang
		rustc
		clippy
		rustfmt
		rust-analyzer
		cargo
		swaybg
		libsForQt5.polkit-kde-agent
	];
}
