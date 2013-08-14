source $HOME/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
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
set smartindent
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
colo molokai

" some xml stuff
command! -nargs=0 FormatXml :silent 1,$!xmllint --format --recover - 2>/dev/null

" toggle outline
map <F8> :TagbarToggle<CR> 
