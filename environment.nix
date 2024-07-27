{...} : {
	environment = {
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};
		sessionVariables = {
			MOZ_ENABLE_WAYLAND = "1";
			ELECTRON_OZONE_PLATFORM_HINT = "wayland";
			NIXOS_OZONE_WL = "1";
		};
	};
}
