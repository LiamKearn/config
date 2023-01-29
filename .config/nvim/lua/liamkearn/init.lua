require('liamkearn.set')

local autocmd = vim.api.nvim_create_autocmd

require("inlay-hints").setup({})

autocmd('InsertEnter', {
	pattern = '*',
	callback = function()
		vim.g.gruvbox_material_background = 'medium'
		vim.cmd('colorscheme ' .. 'gruvbox-material')
	end
})

autocmd('InsertLeave', {
	pattern = '*',
	callback = function()
		vim.g.gruvbox_material_background = 'hard'
		vim.cmd('colorscheme ' .. 'gruvbox-material')
	end
})
