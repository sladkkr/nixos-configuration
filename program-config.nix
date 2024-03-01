with builtins;
{config, ...}: {
	imports = [
		./nvim/main.nix
	];

	programs.firefox.preferences = {
		"layout.css.devPixelsPerPx" =
			if config.networking.hostName == "cobalt" then
				"2.0"
			else
				"1.4";
		"browser.download.start_downloads_in_tmp_dir" = "true";
		"intl.locale.requested" = "pl";
		"browser.download.dir" = "/home/karol/pobrane";
	};
}
