local map = require('utils').map

map('i', '<C-H>', '<C-W>', 'Borrar palabras completas en insert')
map('n', 'S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Ejecuta sed en todo el documento')
map('n', '<space>', ':', 'Mapea <space> para insertar comando')
map('n', 'sh', '<C-w>H', 'Mueve split hacia la izquierda')
map('n', 'sj', '<C-w>J', 'Mueve split hacia abajo')
map('n', 'sk', '<C-w>K', 'Mueve split hacia arriba')
map('n', 'sl', '<C-w>L', 'Mueve split hacia la derecha')
map('n', '<Up>', '<cmd>resize +2<CR>', 'Aumenta altura de split')
map('n', '<Right>', '<cmd>vertical resize -2<CR>', 'Aumenta ancho de split')
map('n', '<Left>', '<cmd>vertical resize +2<CR>', 'Disminuye ancho de split')
map('n', '<Down>', '<cmd>resize -2<CR>', 'Disminuye altura de split')
map('n', 'st', '<C-w>T', 'Convierte split en tab')
map('n', '<C-d>', '<C-d>zz', 'Navega hacia abajo en el buffer')
map('n', '<C-u>', '<C-u>zz', 'Navega hacia arriba en el buffer')
map('n', 'n', 'nzzzv', 'Navega al siguiente resultado de busqueda')
map('n', 'N', 'Nzzzv', 'Navega al anterior resultado de busqueda')

