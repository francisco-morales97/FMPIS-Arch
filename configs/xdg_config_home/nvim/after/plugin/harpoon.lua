local hm = require('harpoon.mark');
local hu = require('harpoon.ui');

require('harpoon').setup {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",

    menu = {
        width = 80,
    }
}

vim.keymap.set('n', '<leader>ha', function()
    hm.add_file();
    local current_file = vim.fn.expand('%:t')
    print('Archivo marcado:', current_file)
end)

vim.keymap.set('n', '<leader>fm', function()
    hu.toggle_quick_menu();
end)

vim.keymap.set('n', '<C-h>', function()
    hu.nav_file(1)
end)

vim.keymap.set('n', '<C-j>', function()
    hu.nav_file(2)
end)

vim.keymap.set('n', '<C-k>', function()
    hu.nav_file(3)
end)

vim.keymap.set('n', '<C-l>', function()
    hu.nav_file(4)
end)
