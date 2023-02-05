local alpha = require('alpha')
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
  dashboard.button("r", "  Archivos recientes ", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "  Nuevo archivo      ", ":enew<CR>"),
  dashboard.button("b", "  Buscar archivo     ", ":Telescope find_files<CR>"),
  dashboard.button("t", "  Buscar texto       ", ":Telescope live_grep<CR>"),
  dashboard.button("s", "  Carpeta Solem      ", ":find ~/Documents/Solem<CR>"),
  dashboard.button("c", "  Neovim config      ", ":find $XDG_CONFIG_HOME/nvim/init.lua<CR>"),
  dashboard.button("q", "  Salir              ", ":qa<CR>"),
}

dashboard.section.footer.val = {
    "                             ",
    "Recuerda que si algo sale mal",
    "    Superate y hazlo peor    ",
    "                             "
}

alpha.setup(dashboard.opts)
