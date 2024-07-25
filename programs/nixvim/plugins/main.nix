pkgs: {
	auto-save.enable = true;
	telescope.enable = true;
	treesitter = import ./treesitter.nix;
	cmp = import ./cmp.nix;
	lsp = import ./lsp.nix pkgs;
}
