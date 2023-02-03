return {
    'nvim-treesitter/playground',
    build = ':TSInstall query',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    }
}
