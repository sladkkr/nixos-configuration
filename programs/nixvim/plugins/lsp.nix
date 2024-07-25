pkgs: {
	enable = true;
	keymaps.lspBuf = {
		"<leader>i" = "hover";
		"<leader>d" = "definition";
		"<leader>r" = "rename";
	};
	servers = {
		nixd.enable = true;
		pyright.enable = true;
		rust-analyzer = {
			enable = true;
			installCargo = true;
			installRustc = true;
		};
		vls = {
			enable = true;
			cmd = [ "${pkgs.steam}/bin/steam-run" "${pkgs.vlang}/bin/v" "ls" ];
		};
		ocamllsp.enable = true;
		bashls.enable = true;
		gdscript.enable = true;
	};
}
