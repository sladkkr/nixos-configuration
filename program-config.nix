{config, lib, ...}: {
	programs = {
		firefox.preferences = {
			"browser.download.start_downloads_in_tmp_dir" = "true";
			"intl.locale.requested" = "pl";
			"browser.download.dir" = "/home/karol/pobrane";
		} ;
		nixvim = {
			viAlias = true;
			vimAlias = true;
			colorschemes.catppuccin.enable = true;
			colorscheme = lib.mkForce "catppuccin-latte";
			globals = {
				netrw_banner = 0;
				mapleader = " ";
			};
			options = {
				number = true;
				relativenumber = true;
				tabstop = 4;
				shiftwidth = 4;
			};
			autoCmd = [
			{
				event = ["VimEnter"];
				command = "lcd %:p:h";
			}
			];
			maps.normal = {
				"<leader>pv" = {
					action = "<cmd>Ex<cr>";
				};
				"<C-u>" = {
					action = "<C-u>zz";
				};
				"<C-d>" = {
					action = "<C-d>zz";
				};
			};
			plugins = {
				treesitter.enable = true;
				nvim-cmp = {
					enable = true;
					mapping = {
						"<C-n>" = "cmp.mapping.select_next_item()";
						"<C-d>" = "cmp.mapping.select_prev_item()";
						"<C-y>" = "cmp.mapping.confirm({select = true})";
					};
					sources = [
						{name = "nvim_lsp";}
						{name = "path";}
					];
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
						rnix-lsp.enable = true;
						clangd.enable = true;
						rust-analyzer.enable = true;
						lua-ls.enable = true;
					};
				};
			};
		};
	};
}
