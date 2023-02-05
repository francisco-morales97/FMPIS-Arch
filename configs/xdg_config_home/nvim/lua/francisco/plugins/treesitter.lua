require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'css',
        'scss',
        'html',
        'json',
        'javascript',
        'lua',
        'regex',
        'typescript',
        'vim'
    },
    highlight = {
        enable = true,
    },
}
