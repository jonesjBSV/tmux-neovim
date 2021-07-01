call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'colepeters/spacemacs-theme.vim'

Plug 'phanviet/vim-monokai-pro'
Plug 'chriskempson/base16-vim'

" Neovim ree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-projectionist'

Plug 'neoclide/coc.nvim'
call plug#end()

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup MONKISH_REX
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


colorscheme gruvbox
highlight Low guibg=none
