{...}: {
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
		globalOpts = {
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
				action = "<esc>:Ex<cr>";
			}
		];
		plugins = {
			auto-save.enable = true;
			treesitter.enable = true;
			telescope = {
				enable = true;
				settings.mappings = {
					n = {
						"<leader>f".__raw = "require'telescope.actions'.find_files";
						"<leader>s".__raw = "require'telescope.actions'.live_grep";
						"<leader>g".__raw = "require'telescope.actions'.git_files";
					};
				};
			};
			cmp.enable = true;
			cmp-nvim-lsp.enable = true;
			lsp = {
				enable = true;
				keymaps = {
					diagnostic = {
						"<C-n>" = "goto_next";
						"<C-p>" = "goto-prec";
					};
					lspBuf = {
						"<leader>i" = "hover";
						"<leader>d" = "definition";
						"<leader>r" = "rename";
					};
				};
				servers = {
					nixd.enable = true;
					pyright.enable = true;
					rust-analyzer.enable = true;
					vls.enable = true;
					bashls.enable = true;
					fsautocomplete.enable = true;
					gdscript.enable = true;
					indent-blankline.enable = true;
				};
			};
		};

	};
}
