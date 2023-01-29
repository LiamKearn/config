return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        configs = {
            -- A list of parser names, or "all"
            ensure_installed = {
                "cmake",
                "c",
                "make",
                "lua",
                "cpp",
                "rust",
                "go",
                "fish",
                "dockerfile",
                "php",
                "yaml",
                "html",
                "javascript",
                "typescript",
                "sql",
                "markdown",
                "json",
                "json5",
                "vue"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },

            indent = {
                enable = true
            },

            playground = {
                enable = true,
                disable = {},
                updatetime = 25
            }
        }
    }
}
