filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible
" useful for gvim
set mousemodel=popup
set hidden
set nohlsearch
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
set relativenumber

" save stuff automatically
au FocusLost * :wa


" colors!
set t_Co=256
colo molokai
