local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Borrar palabras completas en insert
map('i', '<C-H>', '<C-W>')

-- Ejecuta sed en todo el documento
map('n', 'S', ':%s//g<Left><Left>')

-- Mapea <space> para insertar comando
map('n', '<space>', ':')

-- Movimiento entre splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<Tab>', '<cmd>bn<CR>')
map('n', '<S-Tab>', '<cmd>bp<CR>')

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

-- Mapeos para trabajar con buffers
map('n', '<leader>bd', '<cmd>lua MiniBufremove.delete()<CR>')
map('n', '<leader>bu', '<cmd>lua MiniBufremove.unshow()<CR>')

-- Mapeos para trabajar con archivos
map('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>')

map('n', '<leader>fn', '<cmd>TodoTelescope<CR>')


-- Mapeo para sugerencias ortograficas
map('n', '<leader>ss', function()
    require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))
end)

-- Mapeos para trabajar con Git
map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
map('n', '<leader>gc', '<cmd>Telescope git_bcommits<CR>')
map('n', '<leader>gs', '<cmd>Telescope git_stash<CR>')
map('n', '<leader>bl', '<cmd>Gitsigns blame_line<CR>')
