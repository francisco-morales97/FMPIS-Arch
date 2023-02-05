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

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
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

require('mini.move').setup{}

require('mini.bufremove').setup{
    set_vim_settings = true
}
