return {
    'neovim/nvim-lspconfig',
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local lspconfig = require('lspconfig')
        local luasnip = require('luasnip')
        local util = require('lspconfig.util')

        local default_on_attach = function()
            local bufopts = { noremap = true, silent = true, buffer = true }

            vim.keymap.set('n', '<leader>d', function()
                vim.diagnostic.open_float()
                vim.diagnostic.open_float()
            end, bufopts)
            vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, bufopts)
            vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, bufopts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, bufopts)
            vim.keymap.set('n', '<leader>GD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references({ includeDeclaration = false }) end,
                bufopts)
            vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', 'K', function()
                vim.lsp.buf.hover()
                vim.lsp.buf.hover()
            end, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>FF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', bufopts)
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_lsp.default_capabilities(capabilities)

        local ls_defaults = function(custom_opts)
            custom_opts = custom_opts or {}
            return vim.tbl_deep_extend('force', {
                on_attach = default_on_attach,
                capabilities = capabilities,
            }, custom_opts)
        end

        lspconfig['rust_analyzer'].setup(ls_defaults())
        lspconfig['neocmake'].setup(ls_defaults())
        lspconfig['html'].setup(ls_defaults())
        lspconfig['texlab'].setup(ls_defaults())
        lspconfig['gopls'].setup(ls_defaults())
        lspconfig['jdtls'].setup(ls_defaults())
        lspconfig['terraformls'].setup(ls_defaults())
        lspconfig['ruff'].setup(ls_defaults())
        lspconfig['ts_ls'].setup(ls_defaults())
        lspconfig['sourcekit'].setup(ls_defaults({
            filetypes = { "swift", "objective-c", "objective-cpp" }
        }))
        lspconfig['elixirls'].setup(ls_defaults({
            cmd = { "/opt/homebrew/bin/elixir-ls" }
        }))
        lspconfig['clangd'].setup(ls_defaults({
            cmd = { "clangd", },
            on_attach = function()
                vim.keymap.set('n', '<leader>hh', ':ClangdSwitchSourceHeader<cr>',
                    { noremap = true, silent = true, buffer = true })
                default_on_attach()
            end,
            capabilities = {
                offsetEncoding = { "utf-8" },
            }

        }), function()
        end)
        lspconfig['intelephense'].setup(ls_defaults({
            init_options = {
                licenceKey = os.getenv 'INTELEPHENSE_LICENCE_KEY',
                globalStoragePath = os.getenv('XDG_DATA_HOME') .. '/intelephense'
            }
        }))
        lspconfig['lua_ls'].setup(ls_defaults())
        lspconfig['denols'].setup(ls_defaults({
            root_dir = util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
        }))

        local select_opts = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = 'buffer',   keyword_length = 3 },
                { name = 'luasnip',  keyword_length = 2 },
            },
            window = {
                documentation = cmp.config.window.bordered()
            },
            formatting = {
                fields = { 'menu', 'abbr', 'kind' },
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

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
        })
    end
}
