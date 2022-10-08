" CONFIGURACION BASE {{{

" Configurar Leader
let mapleader = ","

" Configuraciones generales 
filetype indent plugin on
syntax on
set nocompatible
set noshowmode
set encoding=utf-8
set confirm
set colorcolumn=80
set termguicolors
set showtabline=2
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set cursorline
set wildmenu
set clipboard+=unnamedplus
set mouse=a
set wrap linebreak nolist
set splitbelow splitright
set hlsearch incsearch
set dictionary=spell
set nospell spelllang=es,en_us
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set scrolloff=8
set path=.,,**
set completeopt=longest,menuone,noselect,noinsert
set shortmess+=c
autocmd BufNewFile,BufRead *.* set autoindent smartindent

"}}}

" FUNCIONALIDADES {{{

" Autocompletado de parentesis, comillas y llaves 
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap < <><Left>

" Salto de linea indentado entre etiquetas HTML
inoremap <C-@> <CR><Esc>O

" Mapea la letra S para ejecutar sed en todo el documento
nnoremap S <cmd>%s//g<Left><Left>

"}}}

" SPLITS {{{

" Configura las teclas para moverse entre Splits 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Tab> <cmd>bn<CR>
nnoremap <silent> <S-Tab> <cmd>bp<CR>
nnoremap <silent> <leader>bd <cmd>bdelete<CR>
" Configura orientacion de Splits
nnoremap sh <C-w>H
nnoremap sj <C-w>J
nnoremap sk <C-w>K
nnoremap sl <C-w>L
" Reajusta tamaño de Splits
nnoremap <silent> <Up> <cmd>resize +2<CR>
nnoremap <silent> <Right> <cmd>vertical resize -2<CR>
nnoremap <silent> <Left> <cmd>vertical resize +2<CR>
nnoremap <silent> <Down> <cmd>resize -2<CR>
" Split to Tab
nnoremap st <C-w>T

"}}}

" PLUGINS {{{

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mattn/emmet-vim'
Plug 'goolord/alpha-nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

lua << EOF
require('francisco')
EOF

" Configuracion de NvimTree
nnoremap <leader>t <cmd>NvimTreeToggle<CR>

" Configuracion de Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>

" Configuracion de Alpha
autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2

" Configuracion de Emmet 
let g:user_emmet_leader_key='<C-z>'
let g:user_emmet_settings = {
\  'variables': {'lang': 'es'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<meta name=\"description\" content=\"\">\n"
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Color scheme
let g:tokyonight_style = 'night'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
colorscheme tokyonight
"}}}
