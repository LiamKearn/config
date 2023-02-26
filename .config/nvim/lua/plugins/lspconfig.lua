-- https://gist.github.com/VonHeikemen/8fc2aa6da030757a5612393d0ae060bd
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
    callback = function ()
        local bufopts = { noremap = true, silent = true, buffer = true }

        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>hh', ':ClangdSwitchSourceHeader<cr>', bufopts)
        vim.keymap.set('n', '<leader>FF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', bufopts)
    end
})

local config = function(_, opts)
    local lspconfig = require('lspconfig')

    local defaults = lspconfig.util.default_config
    defaults.capabilities = vim.tbl_deep_extend(
        'force',
        defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
    )

    local servers = opts.servers
    for server, server_opts in pairs(servers) do
        require('lspconfig')[server].setup(server_opts)
    end

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local select_opts = {behavior = cmp.SelectBehavior.Select}

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        sources = {
            {name = 'path'},
            {name = 'nvim_lsp', keyword_length = 1},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
        },
        window = {
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {'menu', 'abbr', 'kind'},
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    luasnip = '⋗',
                    buffer = 'Ω',
                    path = 'TODO'
                }

                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
            ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

            -- Press twice for bottom (weird but works).
            ['<C-g>'] = cmp.mapping.select_prev_item({count = 9999}),

            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),

            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-y>'] = cmp.mapping.confirm({select = true}),
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            ['<C-f>'] = cmp.mapping(function(fallback)
                if luasnip.jumpable(1) then
                    luasnip.jump(1)
                else
                    fallback()
                end
            end, {'i', 's'}),

            ['<C-b>'] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {'i', 's'}),

            ['<Tab>'] = cmp.mapping(function(fallback)
                local col = vim.fn.col('.') - 1

                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                else
                    cmp.complete()
                end
            end, {'i', 's'}),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                else
                    fallback()
                end
            end, {'i', 's'}),
        },
    })
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'folke/neodev.nvim'
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
            neocmake = {},
            html = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        }
    },
    config = config
}
