"╔═╝╔═║╝╔╔ ╔╔ ║║║╔═║ ╔═║╔═╝
"║ ║╔╔╝║║║║║║║║║║╔═║ ╔╔╝╔═╝
"══╝╝ ╝╝╝╝╝╝╝╝══╝╝ ╝╝╝ ╝══╝
"load vundle
set nocp
set exrc
set secure
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-surround'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'rodjek/vim-puppet'
Plugin 'fs111/pydoc.vim'
Plugin 'rust-lang/rust.vim'

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
let mapleader = ","

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
let g:syntastic_always_populate_loc_list=0
let g:loaded_syntastic_c_avrgcc_checker = 1
let g:syntastic_avrgcc_config_file = '.syntastic_avrgcc_config'
if filereadable(expand('%:p')) && match(readfile(expand('%:p')),"#include <avr")!=-1
  let g:syntastic_c_compiler = 'avr-gcc'
endif

"rust autofmt
let g:rustfmt_autosave=1

"file types
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.pxi set filetype=clojure
au Filetype markdown setlocal textwidth=80
au Filetype python setlocal tabstop=4
au Filetype python setlocal shiftwidth=4
au Filetype dosini setlocal tabstop=4
au Filetype dosini setlocal shiftwidth=4

"Testing things
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>
