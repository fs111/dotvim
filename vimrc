syntax on
filetype plugin indent on

" useful for gvim
set mousemodel=popup
set hidden

set nohlsearch
set incsearch
set ignorecase
set smartcase
set nowrap

set ts=4
set shiftwidth=4
set et!
set visualbell
set wildmenu
set ai
set autoindent
set ttyfast 
set showmatch
set backspace=2
set wildignore=*.o,*.class,*.so*,*.swp,*.pyc,*.pyo,core
set wildmode=longest:full
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_


let mapleader=","
map ,, gqap

set textwidth=120

set cursorline


" always have a statusline
set ls=2
set statusline=%F%m%r%h%w\ (%{&ff}){%y}[%l,%v][%p%%]\ %{strftime(\"%d.%m.%Y\ -\ %H:%M\")}

" line numbers relative from the current one
if version >= 703
    set relativenumber
else
    set nu
endif


" avro idl support
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl


" gitit wiki pages are markdown
au BufRead,BufNewFile *.page setlocal filetype=markdown

" gradle build files
au BufRead,BufNewFile *.gradle setlocal filetype=groovy

" gradle build files
au BufRead,BufNewFile *.adoc setlocal filetype=asciidoc
" colors!
set t_Co=256

" some xml stuff
command! -nargs=0 FormatXml :silent 1,$!xmllint --format --recover - 2>/dev/null

command! -nargs=0 FormatJson :silent 1,$!jq '.' 2>/dev/null

" toggle outline
map <F8> :TagbarToggle<CR> 


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif




" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'mitsuhiko/fruity-vim-colorscheme'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'itspriddle/vim-shellcheck'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colo srcery
let g:airline_theme="light"
" Run PlugInstall if there are missing plugins
"autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \| PlugInstall --sync | source $MYVIMRC
