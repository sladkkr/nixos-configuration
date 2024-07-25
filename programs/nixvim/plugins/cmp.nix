{
	enable = true;
	autoEnableSources = true;
	settings = {
		sources = [
			{name = "nvim_lsp";}
			{name = "async_path";}
		];
		mapping = {
			"<C-n>" = "cmp.mapping.select_next_item()";
			"<C-p>" = "cmp.mapping.select_prev_item()";
			"<C-y>" = "cmp.mapping.confirm({select = true})";
		};
	};
}
