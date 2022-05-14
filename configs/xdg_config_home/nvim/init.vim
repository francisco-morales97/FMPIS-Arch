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
"set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,noselect,noinsert
set shortmess+=c
"set guicursor=n-v-c:block,i-ci-ve:block
autocmd BufNewFile,BufRead *.* set autoindent smartindent

" Configura el espacio para accionar los comandos
nnoremap <Space> :

" Limpia el resaltado de busqueda temporalmente
nnoremap <silent> <Leader>c :noh<CR>

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

" Mapeado para Omnifunc
inoremap <C-s> <C-x><C-o>

" Mapea la letra S para ejecutar sed en todo el documento
nnoremap S :%s//g<Left><Left>

" Configurar explorador de archivos
nnoremap <silent> <Leader>f :Vex!<CR>
let g:netrw_liststyle=3
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

"}}}

" SPLITS {{{

" Configura las teclas para moverse entre Splits 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> th :bp<CR>
nnoremap <silent> tl :bn<CR>
" Configura orientacion de Splits
nnoremap sh <C-w>H
nnoremap sj <C-w>J
nnoremap sk <C-w>K
nnoremap sl <C-w>L
" Reajusta tamaño de Splits
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
" Split to Tab
nnoremap st <C-w>T

"}}}

" PLUGINS {{{

call plug#begin()

Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lifepillar/vim-mucomplete'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

lua << EOF
require('francisco')
EOF

" Configuracion de colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css'
let g:colorizer_skip_comments = 1
let g:colorizer_colornames = 0
let g:colorizer_use_virtual_text = 1

" Configuracion de indentLine
let g:indentLine_fileTypeExclude = ['mom', 'text', 'startify']
let g:indentLine_bufTypeExclude  = ['help']

" Configuracion de Startify
let g:startify_custom_header = [
      \'   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      \'   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      \'   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      \'   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      \'   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      \'   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \ ]
let g:startify_padding_left = 8
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Archivos Recientes'] },
      \ { 'type': 'dir',       'header': ['   Directorio Actual '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sesiones'] },
      \ { 'type': 'bookmarks', 'header': ['   Marcadores'] },
      \ { 'type': 'commands',  'header': ['   Comandos'] },
      \ ]
let g:startify_bookmarks = [
      \ { 'c': '$XDG_CONFIG_HOME/nvim/' },
      \ { 's': '~/Documentos/Solem/proyectos/' },
      \ { 'z': '$XDG_CONFIG_HOME/zsh/.zshrc' }
      \ ]

" Configuracion de Mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
                  \ 'default':    ['file', 'omni', 'user', 'defs', 'incl', 'c-n', 'uspl'],
                  \ 'vim':        ['file', 'keyn', 'cmd',  'omni', 'user', 'c-n', 'uspl'],
                  \ 'text':       ['file', 'c-n',  'uspl', 'omni', 'user'],
                  \ }

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

" Configuracion de Airline
let g:airline_theme = 'onehalfdark'
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#show_buffers = 1
set ttimeoutlen=10

" Color scheme
"autocmd VimEnter * ++nested colorscheme onehalfdark
colorscheme onehalfdark
"}}}