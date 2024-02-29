{pkgs, ...}: {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		configure = {
			packages.my.start = with pkgs.vimPlugins; [
				nvim-treesitter.withAllGrammars
				lsp-zero-nvim
				mason-nvim
				mason-lspconfig-nvim
				telescope-nvim
				onedark-nvim
			];
			customRC = ''
				luafile ${./utils.lua}
				luafile ${./environment.lua}
				luafile ${./remap.lua}
				luafile ${./treesitter.lua}
				luafile ${./telescope.lua}
				luafile ${./lsp.lua}
			'';
		};		
	};
}
