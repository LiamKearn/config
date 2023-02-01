-- TODO: Maybe https://github.com/folke/which-key.nvim
local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend('force',
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind('n', {noremap = false})
M.nnoremap = bind('n')
M.vnoremap = bind('v')
M.xnoremap = bind('x')
M.inoremap = bind('i')
M.snoremap = bind('n', {silent = true})

M.nnoremap('<Up>', '<Nop>')
M.nnoremap('<Down>', '<Nop>')
M.nnoremap('<Left>', '<Nop>')
M.nnoremap('<Right>', '<Nop>')

M.snoremap('{', ':execute "keepjumps norm! " . v:count1 . "{"<CR>')
M.snoremap('}', ':execute "keepjumps norm! " . v:count1 . "}"<CR>')

M.nnoremap('<leader>fq', '<cmd>lua require("telescope.builtin").diagnostics()<cr>')
M.nnoremap('<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>')
M.nnoremap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
M.nnoremap('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical"})<cr>')
M.nnoremap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
M.nnoremap('<leader>fm', '<cmd>lua require("telescope.builtin").man_pages()<cr>')
M.nnoremap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
M.nnoremap('<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
M.nnoremap('<leader>fS', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>')
M.nnoremap('<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>')

M.snoremap('<leader>y', ':call system("socat - UNIX-CLIENT:/home/liam/.run/clipper.sock", @0)<CR>')

return M
