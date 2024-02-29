vim.cmd'colo onedark'
vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.api.nvim_create_autocmd('VimEnter', { command = 'lcd %:p:h'})
vim.g.netrw_banner = 0
