return {
    'folke/neodev.nvim',
    opts = {
        library = {
            enabled = true,
            runtime = true,
            plugins = true,
            types = true,
        },
        lspconfig = true,
        override = function(root_dir, library)
            -- If we're editing anything directly off the configured lazy.nvim
            -- project folder then assume it's vim.
            local lazy_config = require('lazy.core.config')
            if (lazy_config.options.dev ~= nil and lazy_config.options.dev.path) then
                local dev_root = lazy_config.options.dev.path
                local project_name = vim.fs.basename(root_dir)
                if (dev_root .. '/' .. project_name == root_dir) then
                    library.enabled = true
                    library.plugins = true
                end
            end
        end,
    }
}
