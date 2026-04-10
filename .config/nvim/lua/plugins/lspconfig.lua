return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local util = require('lspconfig.util')
        local blink = require('blink.cmp')

        local ls_defaults = function(custom_opts)
            custom_opts = custom_opts or {}
            return vim.tbl_deep_extend('force', {
                capabilities = blink.get_lsp_capabilities(),
            }, custom_opts)
        end

        local omni = vim.fn.expand('~/Documents/omnisharp/OmniSharp.dll')

        vim.lsp.config('omnisharp',ls_defaults({
            on_attach = function()
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
        vim.lsp.enable('omnisharp')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('neocmake')
        vim.lsp.enable('html')
        vim.lsp.enable('texlab')
        vim.lsp.enable('nushell')
        vim.lsp.enable('shopify_theme_ls')
        vim.lsp.enable('gopls')
        vim.lsp.enable('jdtls')
        vim.lsp.enable('terraformls')
        vim.lsp.enable('ruff')
        vim.lsp.enable('ts_ls')
        vim.lsp.config('sourcekit', ls_defaults({
            filetypes = { "swift", "objective-c", "objective-cpp" }
        }))
        vim.lsp.enable('sourcekit')
        vim.lsp.config('elixirls', ls_defaults({
            cmd = { "/opt/homebrew/bin/elixir-ls" }
        }))
        vim.lsp.enable('elixirls')
        vim.lsp.config('clangd', ls_defaults({
            cmd = { "clangd", },
            on_attach = function()
                vim.keymap.set('n', '<leader>hh', ':ClangdSwitchSourceHeader<cr>',
                    { noremap = true, silent = true, buffer = true })
            end,
            capabilities = {
                offsetEncoding = { "utf-8" },
            }

        }), function()
        end)
        vim.lsp.enable('clangd')
        vim.lsp.config('intelephense', ls_defaults({
            init_options = {
                licenceKey = os.getenv 'INTELEPHENSE_LICENCE_KEY',
                globalStoragePath = os.getenv('XDG_DATA_HOME') .. '/intelephense'
            }
        }))
        vim.lsp.enable('intelephense')
        -- vim.lsp.config('lua_ls').setup(ls_defaults())
        vim.lsp.enable('lua_ls')
        vim.lsp.config('denols', ls_defaults({
            root_dir = util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
        }))
        vim.lsp.enable('denols')
    end
}
