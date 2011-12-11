filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible
" useful for gvim
set mousemodel=popup
set hidden

set nohlsearch
set incsearch
set ignorecase
set smartcase

set ts=4
set shiftwidth=4
set et!
set mousemodel=popup
set visualbell
syntax on
set wildmenu
set ai
set smartindent
set ruler
set ttyfast 
set showmatch
set backspace=2
set wildignore=*.o,*.class,*.so*,*.swp,*.pyc,*.pyo,core
set wildmode=longest:full
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

set textwidth=80


" always have a statusline
set ls=2
set statusline=%F%m%r%h%w\ (%{&ff}){%y}[%l,%v][%p%%]\ %{strftime(\"%d.%m.%Y\ -\ %H:%M\")}

" line numbers relative from the current one
if version >= 730
    set relativenumber
else
    set nu
endif

" save stuff automatically
"au FocusLost * :wa

" avro idl support
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl


" colors!
set t_Co=256
colo molokai

" some xml stuff

command! -nargs=0 FormatXml :silent 1,$!xmllint --format --recover - 2>/dev/null
