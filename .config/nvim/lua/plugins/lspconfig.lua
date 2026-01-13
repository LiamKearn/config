return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require('lspconfig')
        local util = require('lspconfig.util')
        local blink = require('blink.cmp')

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

        local ls_defaults = function(custom_opts)
            custom_opts = custom_opts or {}
            return vim.tbl_deep_extend('force', {
                on_attach = default_on_attach,
                capabilities = blink.get_lsp_capabilities(),
            }, custom_opts)
        end

        local omni = vim.fn.expand('~/Documents/omnisharp/OmniSharp.dll')


        -- TODO: Seems each .setup is evaluated regardless of filetype / what
        -- not?
        lspconfig['omnisharp'].setup(ls_defaults({
            on_attach = function()
                default_on_attach()
                -- Specfic overrides to support decompilation via $metadata$
                -- from omnisharp_extended plugin
                vim.keymap.set('n', '<leader>gd',
                    require('omnisharp_extended').lsp_definition, {
                        noremap =
                            true,
                        silent = true,
                        buffer = true
                    })
                vim.keymap.set('n', '<leader>gt',
                    require('omnisharp_extended').lsp_type_definition, {
                        noremap
                        = true,
                        silent = true,
                        buffer = true
                    })
                vim.keymap.set('n', '<leader>gr',
                    require('omnisharp_extended').lsp_references, {
                        noremap =
                            true,
                        silent = true,
                        buffer = true
                    })
                vim.keymap.set('n', '<leader>gi',
                    require('omnisharp_extended').lsp_implementation, {
                        noremap
                        = true,
                        silent = true,
                        buffer = true
                    })
            end,
            cmd = {
                'dotnet',
                omni,
                '-z', -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
                '--hostPID',
                tostring(vim.fn.getpid()),
                'DotNet:enablePackageRestore=false',
                '--encoding',
                'utf-8',
                '--languageserver',
            },
            settings = {
                RoslynExtensionsOptions = {
                    EnableDecompilationSupport = true,
                },
            },
        }))
        lspconfig['rust_analyzer'].setup(ls_defaults())
        lspconfig['neocmake'].setup(ls_defaults())
        lspconfig['html'].setup(ls_defaults())
        lspconfig['texlab'].setup(ls_defaults())
        lspconfig['nushell'].setup(ls_defaults())
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
    end
}
