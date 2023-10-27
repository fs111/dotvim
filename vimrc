syntax on
filetype plugin indent on

set hidden

set nohlsearch
set incsearch
set ignorecase
set smartcase
set nowrap

set number

" very useful for go files when they are changed by go fmt
set autoread

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

let mapleader=","
map ,, gqap

set textwidth=120

set cursorline

" always have a statusline
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%y}[%l,%v][%p%%]\ %{strftime(\"%d.%m.%Y\ -\ %H:%M\")}

" gradle build files
au BufRead,BufNewFile *.gradle setlocal filetype=groovy

" Jenkinsfile
au BufRead,BufNewFile Jenkinsfile setlocal filetype=groovy

" asciidoc files
au BufRead,BufNewFile *.adoc setlocal filetype=asciidoc

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
Plug 'vim-scripts/matchit.zip'
Plug 'vim-airline/vim-airline'
Plug 'itspriddle/vim-shellcheck'
Plug 'vim-airline/vim-airline-themes'
Plug 'mtth/scratch.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fs111/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" this must be done before setting the color theme
set termguicolors

if has('mac')
    " uctags understand go
    let g:tagbar_ctags_bin = '/opt/local/bin/uctags'
endif

set background=dark
colo PaperColor
let g:airline_theme = 'papercolor'

" scratch file location
let g:scratch_persistence_file='~/tmp/.vimscratch'

map <leader>lf :LspDocumentFormat<CR>
map <leader>ld :LspDefinition<CR>
map <leader>lr :LspRename<CR>
map <leader>loi :LspCodeActionSync source.organizeImports<CR>
map <leader>lh :LspHover<CR>


