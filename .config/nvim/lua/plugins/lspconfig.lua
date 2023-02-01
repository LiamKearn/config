return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'ray-x/lsp_signature.nvim',
    },
    opts = {
        servers = {
            intelephense = {
                init_options = {
                    licenceKey = os.getenv 'INTELEPHENSE_LICENCE_KEY'
                }
            },
            clangd = {},
            rust_analyzer = {},
            neocmake = {}
        }
    },
    config = function(plugin, opts)
        local signature = require('lsp_signature');
        local on_attach = function(client, buffer)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Uncomment for inlayhints
            -- require('inlay-hints').on_attach(client, buffer)

            signature.on_attach({
                bind = true,
                floating_window_above_cur_line = false,
                hint_prefix = '',
                handler_opts = {
                    border = 'rounded'
                }
            }, buffer)

            local bufopts = { noremap=true, silent=true, buffer=buffer }
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>hh', ':ClangdSwitchSourceHeader<cr>', bufopts)
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local servers = opts.servers

        for server, server_opts in pairs(servers) do
            server_opts.capabilities = capabilities
            server_opts.on_attach = on_attach
            require('lspconfig')[server].setup(server_opts)
        end
    end
}
