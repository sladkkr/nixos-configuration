{pkgs, ...}: {
	programs.nixvim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		colorschemes.kanagawa.enable = true;
		clipboard.providers.wl-copy.enable = true;
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
		keymaps = [
			{
				key = "<C-u>";
				action = "<C-u>zz";
			}

			{
				key = "<C-d>";
				action = "<C-d>zz";
			}

			{
				key = "<leader>v";
				action = ":Ex<cr>";
			}

			{
				key = "<leader>f";
				action = "<cmd>Telescope find_files<cr>";
			}

			{
				key = "<leader>g";
				action = "<cmd>Telescope git_files<cr>";
			}

			{
				key = "<leader>s";
				action = "<cmd>Telescope live_grep<cr>";
			}
		];
		plugins = {
			auto-save.enable = true;
			treesitter = {
				enable = true;
				settings = {
					auto_install = true;
					highlight.enable = true;
				};
			};
			telescope.enable = true;
			cmp = {
				enable = true;
				autoEnableSources = true;
				settings.sources = [{name = "nvim_lsp";}];
			};
			cmp-nvim-lsp.enable = true;
			cmp-path.enable = true;
			lsp = {
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
			};
		};

	};
}
