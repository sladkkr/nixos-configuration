{pkgs, config, lib, ...}: {
	qt.style = "adwaita";
	programs = {
		firefox.preferences = {
			"browser.download.start_downloads_in_tmp_dir" = "true";
			"intl.locale.requested" = "pl";
			"browser.tabs.closeWindowWithLastTab" = "false";
		} ;
		nixvim = {
			viAlias = true;
			vimAlias = true;
			colorschemes.onedark.enable = true;
			globals = {
				netrw_banner = 0;
				mapleader = " ";
			};
			opts = {
				number = true;
				relativenumber = true;
				tabstop = 4;
				shiftwidth = 4;
				background = "light";
			};
			autoCmd = [
			{
				event = ["VimEnter"];
				command = "lcd %:p:h";
			}
			];
			keymaps = [
				{
					action = "<cmd>Ex<cr>";
					key = "<leader>pv";
				}
				{
					action = "<C-u>zz";
					key = "<C-u>";
				}
				{
					action = "<C-d>zz";
					key = "<C-d>";
				}
			];
			plugins = {
				treesitter.enable = true;
				cmp = {
					enable = true;
					settings = {

						mapping = {
							"<C-n>" = "cmp.mapping.select_next_item()";
							"<C-d>" = "cmp.mapping.select_prev_item()";
							"<C-y>" = "cmp.mapping.confirm({select = true})";
						};
						sources = [
						{name = "nvim_lsp";}
						{name = "path";}
						{name = "snippy";}
						];
					};
				};
				telescope = {
					enable = true;
					keymaps = {
						"<leader>pf" = "find_files";
						"<leader>gf" = "git_files";
					};
				};
				lsp = {
					enable = true;
					keymaps.lspBuf = {
						"<leader>si" = "hover";
						"<leader>sr" = "rename";
						"<leader>sd" = "definition";
					};
					servers = {
						clangd.enable = true;
						rust-analyzer = {
							enable = true;
							installCargo = true;
							installRustc = true;
						};
						lua-ls.enable = true;
						bashls.enable = true;
						gopls.enable = true;
					};
				};
			};
		};
	};
}
