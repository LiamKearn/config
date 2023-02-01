return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer'
    },
    opt = function()
        local cmp = require("cmp")
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
        }
    end
}
