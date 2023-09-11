require('nvim-tree').setup {
    filters = {
        dotfiles = false,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        adaptive_size = true,
        side = "right",
        width = 25,
    },
    git = {
        enable = false,
        ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        root_folder_label = false,

        indent_markers = {
            enable = true,
        },

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
        },
    }
}

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')
-- vim.cmd([[highlight NvimTreeNormal guibg='#141925']])
