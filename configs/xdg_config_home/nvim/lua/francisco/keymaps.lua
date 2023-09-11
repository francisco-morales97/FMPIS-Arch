local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Borrar palabras completas en insert
map('i', '<C-H>', '<C-W>')

-- Ejecuta sed en todo el documento
map('n', 'S', ':%s//g<Left><Left>')

-- Mapea <space> para insertar comando
map('n', '<space>', ':')

-- Navegacion entre buffers
-- map('n', '<tab>', ':bn<CR>')
-- map('n', '<S-tab>', ':bp<CR>')

-- Orientacion de splits
map('n', 'sh', '<C-w>H')
map('n', 'sj', '<C-w>J')
map('n', 'sk', '<C-w>K')
map('n', 'sl', '<C-w>L')

-- Tamaño de splits
map('n', '<Up>', '<cmd>resize +2<CR>')
map('n', '<Right>', '<cmd>vertical resize -2<CR>')
map('n', '<Left>', '<cmd>vertical resize +2<CR>')
map('n', '<Down>', '<cmd>resize -2<CR>')

-- Convierte split en tab
map('n', 'st', '<C-w>T')

-- Mueve bloque seleccionado
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Movimiento vertical
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
