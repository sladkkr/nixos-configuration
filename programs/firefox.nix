{...}: {
	programs.firefox = {
		enable = true;
		preferences = {
			"browser.download.start_downloads_in_tmp_dir" = "true";
			"intl.locale.requested" = "pl";
			"browser.tabs.closeWindowWithLastTab" = "false";
		};
	};
}
