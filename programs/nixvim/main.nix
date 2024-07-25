{pkgs, ...}: {
	programs.nixvim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		colorschemes.kanagawa.enable = true;
		clipboard = {
			providers.wl-copy.enable = true;
			register = "unnamedplus";
		};
		globals = {
			mapleader = " ";
			netrw_banner = false;
		};
		globalOpts= {
			number = true;
			relativenumber = true;
			tabstop = 4;
			shiftwidth = 4;
		};
		autoCmd = [
			{
				command = "lcd %:p:h";
				event = ["VimEnter"];
			}
		];
		keymaps = import ./keybinds.nix;
		plugins = import plugins/main.nix pkgs;
	};
}
