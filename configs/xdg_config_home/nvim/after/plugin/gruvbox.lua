require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = false, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        TelescopeBorder = { fg = '#83a598' },
        TelescopePromptBorder = { fg = '#d79921' },
        TelescopePromptTitle = { fg = '#d79921' },
        TelescopePreviewTitle = { fg = '#83a598' },
        TelescopeResultsTitle = { fg = '#83a598' },
    },
    dim_inactive = true,
    transparent_mode = false,
})

vim.cmd[[ colorscheme gruvbox ]]
