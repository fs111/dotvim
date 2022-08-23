syntax on
filetype plugin indent on

set hidden

set nohlsearch
set incsearch
set ignorecase
set smartcase
set nowrap

set dir=~/tmp/

set ts=4
set shiftwidth=4
set et!
set visualbell
set autoindent
set ttyfast 
set showmatch
set backspace=2
set wildmenu
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
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%y}[%l,%v][%p%%]\ %{strftime(\"%d.%m.%Y\ -\ %H:%M\")}

set relativenumber

" avro idl support
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" gitit wiki pages are markdown
au BufRead,BufNewFile *.page setlocal filetype=markdown

" gradle build files
au BufRead,BufNewFile *.gradle setlocal filetype=groovy

" Jenkinsfile
au BufRead,BufNewFile Jenkinsfile setlocal filetype=groovy

" asciidoc files
au BufRead,BufNewFile *.adoc setlocal filetype=asciidoc

" some xml stuff
command! -nargs=0 FormatXml :silent 1,$!xmllint --format --recover - 2>/dev/null

command! -nargs=0 FormatJson :silent 1,$!jq '.' 2>/dev/null

" sql formatter. part of the sqlparse python package
command! -nargs=0 FormatSQL :silent 1,$!sqlformat-3.10 -k upper -a -s - 2>/dev/null

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
Plug 'vim-scripts/matchit.zip'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'itspriddle/vim-shellcheck'
Plug 'vim-airline/vim-airline-themes'
Plug 'gelguy/wilder.nvim'
Plug 'mtth/scratch.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fs111/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Rigellute/rigel'
Plug 'rodjek/vim-puppet'
call plug#end()

if has('mac')
    set termguicolors
    let g:tagbar_ctags_bin = '/opt/local/bin/uctags'
endif

"colo srcery
"let g:airline_theme="light"

colo rigel
let g:rigel_airline = 1
let g:airline_theme = 'rigel'

" Run PlugInstall if there are missing plugins
"autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \| PlugInstall --sync | source $MYVIMRC

" wilder.nvim setup
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

" scratch file location
let g:scratch_persistence_file='~/tmp/.vimscratch'
