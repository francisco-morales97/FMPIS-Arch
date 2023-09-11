-- NOTE: Normal config

-- require('lualine').setup {
--     options = {
--         icons_enabled = true,
--         theme = 'ayu_mirage',
--         component_separators = { left = '', right = ''},
--         section_separators = { left = '', right = ''},
--         disabled_filetypes = {
--             'NvimTree',
--         },
--         ignore_focus = {},
--         always_divide_middle = true,
--         globalstatus = false,
--         refresh = {
--             statusline = 1000,
--             tabline = 1000,
--             winbar = 1000,
--         }
--     },
--     sections = {
--         lualine_a = {'filename'},
--         lualine_b = {'branch', 'diff', 'diagnostics'},
--         lualine_c = {},
--         lualine_x = {'encoding', 'filetype'},
--         lualine_y = {'progress'},
--         lualine_z = {'location'}
--     },
--     inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {'filename'},
--         lualine_x = {'location'},
--         lualine_y = {},
--         lualine_z = {}
--     },
--     tabline = {},
--     winbar = {},
--     inactive_winbar = {},
--     extensions = {}
-- }

-- NOTE: Eviline config

local lualine = require('lualine')

-- NOTE: Colores para ayu
-- local colors = {
--     bg       = '#272d38',
--     bg_off   = '#191E2A',
--     fg       = '#CBCCC6',
--     yellow   = '#FFD580',
--     cyan     = '#5CCFE6',
--     darkblue = '#232A4C',
--     green    = '#BAE67E',
--     orange   = '#FFA759',
--     violet   = '#D4BFFF',
--     magenta  = '#D4BFFF',
--     blue     = '#73D0FF',
--     red      = '#F27983',
-- }

-- NOTE: Colores para rose-pine
-- local colors = {
--     bg       = '#393552',
--     bg_off   = '#2a283e',
--     fg       = '#e0def4',
--     yellow   = '#f6c177',
--     cyan     = '#ea9a97',
--     darkblue = '',
--     green    = '#3e8fb0',
--     orange   = '#ea9a97',
--     violet   = '#c4a7e7',
--     magenta  = '#c4a7e7',
--     blue     = '#9ccfd8',
--     red      = '#eb6f92',
-- }

-- NOTE: Colores para tokyonight
-- local colors = {
--     bg       = '#2f334d',
--     bg_off   = '#1E2030',
--     fg       = '#C8D3f5',
--     yellow   = '#FFC777',
--     cyan     = '#4FD6BE',
--     darkblue = '#3E68D7',
--     green    = '#C3E88D',
--     orange   = '#FF966C',
--     violet   = '#FCA7EA',
--     magenta  = '#C099FF',
--     blue     = '#65BCFF',
--     red      = '#FF757F',
-- }

-- NOTE: Colores para onedark
local colors = {
    bg       = '#21252b',
    fg       = '#abb2bf',
    yellow   = '#e5c07b',
    cyan     = '#56b6c2',
    darkblue = '#73b8f1',
    green    = '#98c379',
    orange   = '#d19a66',
    violet   = '#8a3fa0',
    magenta  = '#c678dd',
    blue     = '#61afef',
    red      = '#e86671',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        globalStatus = true,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return '▊'
    end,
    -- color = { fg = colors.blue },
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.red,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 0, right = 1 },
}

ins_left {
    function()
        return ''
    end,
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.red,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}

ins_left {
    'branch',
    icon = '',
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.red,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
    end,
}

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

ins_left {
    function()
        return '%='
    end,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.fg, gui = 'bold' }
}

ins_right {
    'diff',
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.red,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
    end,
}

ins_right {
    function()
        return '▊'
    end,
    -- color = { fg = colors.blue },
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.red,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 1 },
}

lualine.setup(config)
