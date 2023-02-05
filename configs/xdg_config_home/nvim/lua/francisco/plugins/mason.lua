require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'angularls',
        'emmet_ls',
        'cssls',
        'html',
        'tsserver'
    }
})
