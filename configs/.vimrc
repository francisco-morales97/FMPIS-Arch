" CONFIGURACION BASE {{{

" Configurar Leader
let mapleader = ","

" Configuraciones generales 
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
set nospell spelllang=es,en_us
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set scrolloff=8
filetype indent plugin on
syntax on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
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

" SPLITS Y TABS {{{

" Configura las teclas para moverse entre Splits 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>

" Configura las teclas para moverse entre Tabs
nnoremap <silent> th :tabprevious<CR>
nnoremap <silent> tl :tabnext<CR>

"}}}

" PLUGINS {{{

" Configuracion de Goyo 
nnoremap <silent> <Leader>g :Goyo<CR>
let g:goyo_width=70
function! s:goyo_enter()
  set showmode
endfunction
function! s:goyo_leave()
  set noshowmode
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd User GoyoEnter,GoyoLeave hi Normal guibg=NONE ctermbg=NONE

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
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Configuracion de Airline
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#show_buffers = 0
set ttimeoutlen=10

" Gruvbox color scheme
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_italic = 1
autocmd VimEnter * ++nested colorscheme gruvbox
autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
set background=dark

"}}}
