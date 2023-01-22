local Remap = require("liamkearn.keymap")
local nnoremap = Remap.nnoremap
local snoremap = Remap.snoremap

nnoremap("<leader>fq", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
nnoremap("<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nnoremap("<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
nnoremap("<leader>fS", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
nnoremap("<leader>fr", "<cmd>lua require('telescope.builtin').resume()<cr>")
snoremap("<leader>y", ":call system('socat - UNIX-CLIENT:/home/liam/.run/clipper.sock', @0)<CR>")

