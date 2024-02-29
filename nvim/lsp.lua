local lsp = require'lsp-zero'
local mason = require'mason'
local mason_lsp = require'mason-lspconfig'

lsp.preset'recommended'
lsp.set_preferences{
	sign_icons = {}
}

lsp.on_attach(function(client, buffnr)
	local opts = {buffer = buffnr, remap = false}

	vim.keymap.set('n', '<leader>sr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set('n', '<leader>sd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', '<leader>si', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
end)

lsp.setup()

mason.setup({})
mason_lsp.setup({
	ensure_installed = {'pyright', 'lua_ls', 'rust_analyzer', 'clangd'},
	handlers = {
		lsp.default_setup,
	},
})
