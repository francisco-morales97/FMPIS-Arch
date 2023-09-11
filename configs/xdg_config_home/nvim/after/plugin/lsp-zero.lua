require('mason.settings').set({
    ui = {
        border = 'rounded'
    }
})

local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
    'html',
    'cssls',
    'emmet_ls',
    'tsserver',
    'angularls',
    'volar',
    'lua_ls',
})

lsp.on_attach(function(client, bufnr)
    local function map(m, k, v, desc)
        vim.keymap.set(m, k, v, {
            buffer = bufnr,
            remap = false,
            desc = desc
        })
    end

    map("n", "gd", function() vim.lsp.buf.definition() end, "[G]o to [D]efinition")
    map("n", "K", function() vim.lsp.buf.hover() end, "Show info when [H]overing")
    map("n", "gl", function() vim.diagnostic.open_float() end, "Show dia[G]nostic in a f[L]oating window")
    map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, "[V]ariable [C]ode [A]ction")
    map("n", "gr", '<cmd>Telescope lsp_references<CR>', "[G]o to [R]efrences")
    map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, "[V]ariable [R]e[N]ame")
end)

local border = {
    { "╭" },
    { "─" },
    { "╮" },
    { "│" },
    { "╯" },
    { "─" },
    { "╰" },
    { "│" },
}

-- LSP settings (for overriding per client)
local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require('lspconfig.ui.windows').default_options = {
    border = border
}

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

local kind_icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
            })[entry.source.name]
            return vim_item
        end
    },
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})
