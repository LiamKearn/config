local Remap = require("liamkearn.keymap")
local nnoremap = Remap.nnoremap

nnoremap("Up", "<Nop>")
nnoremap("Down", "<Nop>")
nnoremap("Left", "<Nop>")
nnoremap("Right", "<Nop>")

nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nnoremap("<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep     for > \")})<CR>")

