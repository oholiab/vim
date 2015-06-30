"load vundle
set nocp
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'jonathanfilip/vim-lucius'

call vundle#end()
filetype plugin indent on

"make it usable
syntax on
set nu
set cuc
set cul
set t_Co=256
hi CursorLine ctermbg=234
hi CursorColumn ctermbg=234
set wildmenu
command! Reload so ~/.vimrc
if exists('+colorcolumn')
  hi ColorColumn ctermbg=darkgrey guibg=darkgrey
  set cc=80
endif
nmap <silent> <C-p> :bprevious!<CR>
nmap <silent> <C-n> :bnext!<CR>

"tab expansion
set tabstop=2
set expandtab
set backspace=indent,eol,start

"autoindentation
set shiftwidth=2
set pastetoggle=<F2>


"make it pretty
colorscheme lucius
LuciusBlackHighContrast
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⭃'
let g:airline_right_sep = '⬵ '
let g:airline_left_alt_sep = '⭄ '
let g:airline_symbols.branch = '⸙'
let g:airline_symbols.paste = '⚸'
let g:airline_symbols.linenr = '⬲ '
let g:airline#extensions#whitespace#symbol = '💀 '
let g:airline#extensions#whitespace#trailing_format = 'tr[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mi[%s]'
let g:airline_mode_map = {
  \ 'i' : '🜏 ',
  \ 'n' : '⛧ ',
  \ }
let g:airline_theme = 'ubaryd'

"info
set ruler
set laststatus=2

let hostname = substitute(system('hostname'), '\n', '', '')

" Syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
