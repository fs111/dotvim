set nocompatible
set mousemodel=popup
set nu
set nohlsearch
set ts=4
set shiftwidth=4
set et!
set mousemodel=popup
set visualbell
syntax on
filetype on
filetype plugin on
filetype indent on
set wildmenu
set ai
set nu!
set ruler
set ttyfast 
set showmatch
"set nobackup
set backspace=2
"set foldmethod=syntax
"set foldlevel=5
set wildignore=*.o,*.class,*.so*,*.swp,*.pyc,*.pyo,core
set wildmode=longest:full
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
set textwidth=80
set ls=2
set statusline=%F%m%r%h%w\ (%{&ff}){%y}[%l,%v][%p%%]\ %{strftime(\"%d.%m.%Y\ -\ %H:%M\")}


call pathogen#infect()

colo fruity
