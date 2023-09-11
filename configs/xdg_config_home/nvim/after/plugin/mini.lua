require('mini.comment').setup{}

require('mini.indentscope').setup{
    draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 50,
        animation = require('mini.indentscope').gen_animation.linear({
            easing = 'in-out',
            duration = 3,
            unit = 'step'
        })
    },

    options = {
        border = 'both',
        indent_at_cursor = true,
        try_as_border = false,
    },

    symbol = '╎'
}

require('mini.pairs').setup{
    modes = { insert = true, command = false, terminal = false },

    -- Global mappings. Each right hand side should be a pair information, a
    -- table with at least these fields (see more in |MiniPairs.map|):
    -- - <action> - one of 'open', 'close', 'closeopen'.
    -- - <pair> - two character string for pair to be used.
    -- By default pair is not inserted after `\`, quotes are not recognized by
    -- `<CR>`, `'` does not insert pair after a letter.
    -- Only parts of tables can be tweaked (others will use these defaults).
    mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
        ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
        ['`'] = { action = 'open', pair = '``', neigh_pattern = '[^\\].' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
        ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        ['`'] = { action = 'close', pair = '``', neigh_pattern = '[^\\].' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        -- ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
        ['<'] = { action = 'closeopen', pair = '<>', neigh_pattern = '[^\\].' },
    },
}

require('mini.surround').setup{
    highlight_duration = 500,

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = '', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
    },
}

require('mini.bufremove').setup{ set_vim_settings = true }

local gen_hook = require('mini.splitjoin').gen_hook
local curly = { brackets = { '%b{}' } }
local pad_curly =  gen_hook.pad_brackets(curly)

require('mini.splitjoin').setup {
    mappings = { toggle = 'gS' },
    join = {
        hooks_post = { pad_curly }
    }
}

-- require('mini.tabline').setup{}

-- Keymaps
vim.keymap.set('n', '<leader>bd', '<cmd>lua MiniBufremove.delete()<CR>')
vim.keymap.set('n', '<leader>bu', '<cmd>lua MiniBufremove.unshow()<CR>')

-- Autocomands
local group = vim.api.nvim_create_augroup('MiniFileTypeDisabling', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'NvimTree', 'alpha' },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
    group = group,
})
