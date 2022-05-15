set encoding=UTF-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set fileformat=unix
set undodir=~/.vim/undodir/
set undofile
set nobackup
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set clipboard+=unnamedplus
set spellfile=~/.config/spell/en.utf-8.add
set spell spelllang=en_us

"autocmd FileType markdown setlocal spell
"autocmd FileType gitcommit setlocal spell
"
"autocmd FileType markdown setlocal complete+=kspell
"autocmd FileType gitcommit setlocal complete+=kspell

set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*a
set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
