local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

dashboard.section.buttons.val = {
  dashboard.button("r", "  Archivos recientes", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "  Nuevo archivo     ", ":enew<CR>"),
  dashboard.button("b", "  Buscar archivo    ", ":Telescope find_files<CR>"),
  dashboard.button("t", "  Buscar texto      ", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  Neovim config     ", ":find $XDG_CONFIG_HOME/nvim/init.vim<CR>"),
  dashboard.button("q", "  Salir             ", "ZQ"),
}

require('alpha').setup(dashboard.config)
