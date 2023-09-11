local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local actions = require('telescope.actions')
local opts = { initial_mode = 'normal' }

require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = ' ',
        entry_prefix = " ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        path_display = { 'shorten' },
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            preview_cutoff = 120,
        },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ['<C-r>'] = actions.delete_buffer
                }
            }
        }
    },
    extensions = {
        ["ui-select"] = {
            themes.get_cursor {
                codeactions = true
            }
        }
    }
}

require('telescope').load_extension('ui-select')

-- Keymaps
vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end)
vim.keymap.set('n', '<leader>ft', function() builtin.live_grep() end)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers(opts) end)
vim.keymap.set('n', '<leader>fo', function() builtin.oldfiles() end)
vim.keymap.set('n', '<leader>fg', function() builtin.git_files() end)
vim.keymap.set('n', '<leader>gb', function() builtin.git_branches(opts) end)
vim.keymap.set('n', '<leader>gc', function() builtin.git_bcommits() end)
vim.keymap.set('n', '<leader>gs', function() builtin.git_stash(opts) end)
vim.keymap.set('n', '<leader>ss', function() builtin.spell_suggest(themes.get_cursor(opts)) end)
