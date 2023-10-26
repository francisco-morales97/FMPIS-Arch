return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local map = require('utils').map
        local conform = require('conform')
        local format_opts = {
            lsp_fallback = true,
            timeout_ms = 500,
        }

        conform.setup({
            formatters_by_ft = {
                javascript = { 'eslint_d' },
                typescript = { 'eslint_d' },
                vue = { 'eslint_d' },
                css = { 'prettier' },
                scss = { 'prettier' },
                html = { 'prettier' }
            },
            format_on_save = format_opts,
        })

        map({ 'n', 'v' }, '<leader>fc', function()
            conform.format(format_opts)
        end, 'Formatea archivo o rango en modo visual')
    end
}
