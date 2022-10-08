require('nvim-tree').setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  reload_on_bufenter = true,
  view = {
    adaptive_size = true,
    side = "right"
  },
  update_focused_file = {
    enable = true,
    update_root = true
  }
}
