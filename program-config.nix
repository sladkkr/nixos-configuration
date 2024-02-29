{...}: {
	imports = [
		./nvim/main.nix
	];

	programs.firefox.preferences = {
		"layout.css.devPixelsPerPx" = "1.5";
		"browser.download.start_downloads_in_tmp_dir" = "true";
		"intl.locale.requested" = "pl";
		"browser.download.dir" = "/home/karol/pobrane";
	};
}
