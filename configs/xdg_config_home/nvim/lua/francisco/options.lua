local g = vim.g
local opt = vim.opt

g.mapleader = ','
g.user_emmet_leader_key = '<C-z>'

opt.compatible = false
opt.showmode = false
opt.encoding = 'utf-8'
opt.confirm = true
opt.termguicolors = true
opt.clipboard:append('unnamedplus')
opt.mouse = 'a'

opt.colorcolumn = '80'
opt.cursorline = true
opt.relativenumber = true
opt.scrolloff = 8

opt.showtabline = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = true
opt.linebreak = true
opt.list = false

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.wildmenu = true
opt.shortmess:append('c')
opt.completeopt = {
    'longest',
    'menuone',
    'noselect',
    'noinsert'
}

opt.autoindent = true
opt.smartindent = true
opt.cindent = true

opt.dictionary = 'spell'
opt.spell = false
opt.spelllang = {
    'es',
    'en_us'
}
