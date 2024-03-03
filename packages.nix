{pkgs, ...}: {
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
		softmaker-office
		transmission
		playerctl
		pulsemixer
		light
		nodejs_20
		ncspot
		telegram-desktop
		bottles
		heroic
		ulauncher
		mako
		kitty
		thunderbird
		clang-tools_17
		unzip
		unrar
		python3
		clang
		llvmPackages.clangUseLLVM
		rustc
		clippy
		rustfmt
		rust-analyzer
		cargo
		swaybg
		libsForQt5.polkit-kde-agent
	];
}
