return {
    'neovim/nvim-lspconfig',
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local lspconfig = require('lspconfig')
        local luasnip = require('luasnip')
        local util = require('lspconfig.util')

        local on_attach = function()
            local bufopts = { noremap = true, silent = true, buffer = true }

            -- TODO: Make diagnostics window focus by default (maybe like done with
            -- hover or better via opts to open_float if possible).
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
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
            vim.keymap.set('n', '<leader>hh', ':ClangdSwitchSourceHeader<cr>', bufopts)
            vim.keymap.set('n', '<leader>FF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', bufopts)
        end


        -- Always open floating windows with a border.
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        ---@diagnostic disable-next-line: duplicate-set-field Intentional monkey patch.
        function vim.lsp.util.open_floating_preview(contents, syntax, options, ...)
            options = options or {}
            options.border = options.border or {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }
            return orig_util_open_floating_preview(contents, syntax, options, ...)
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_lsp.default_capabilities(capabilities)
        local with_defaults = function(opts)
            opts = opts or {}
            opts.on_attach = on_attach
            opts.capabilities = capabilities
            return opts
        end

        lspconfig['rust_analyzer'].setup(with_defaults())
        lspconfig['neocmake'].setup(with_defaults())
        lspconfig['html'].setup(with_defaults())
        lspconfig['texlab'].setup(with_defaults())
        lspconfig['gopls'].setup(with_defaults())
        lspconfig['jdtls'].setup(with_defaults())
        lspconfig['terraformls'].setup(with_defaults())
        lspconfig['ruff'].setup(with_defaults())
        lspconfig['ts_ls'].setup(with_defaults())
        lspconfig['sourcekit'].setup(with_defaults({
            filetypes = { "swift", "objective-c", "objective-cpp" }
        }))
        lspconfig['elixirls'].setup(with_defaults({
            cmd = { "/opt/homebrew/bin/elixir-ls" }
        }))
        lspconfig['clangd'].setup(with_defaults({
            cmd = { "clangd", "--offset-encoding=utf-16", },
        }))
        lspconfig['intelephense'].setup(with_defaults({
            init_options = {
                licenceKey = os.getenv 'INTELEPHENSE_LICENCE_KEY',
                globalStoragePath = os.getenv('XDG_DATA_HOME') .. '/intelephense'
            }
        }))
        lspconfig['lua_ls'].setup(with_defaults())
        lspconfig['denols'].setup(with_defaults({
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
