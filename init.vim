

call plug#begin('~/.vim/plugged')

"Dev icons
Plug 'ryanoasis/vim-devicons'

"Fix lsp doc highlight
Plug 'antoinemadec/FixCursorHold.nvim'

"Autoclose quotes, parens, brackets, etc.
Plug 'windwp/nvim-autopairs'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"Plug 'phanviet/vim-monokai-pro'
"Plug 'chriskempson/base16-vim'

" Neovim ree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

"Colorscheme
Plug 'gruvbox-community/gruvbox'

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
"Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'

"LSP completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'mfussenegger/nvim-jdtls'

"Snippets
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.config/nvim/github-markdown.css'

"harpoon
Plug 'ThePrimeagen/harpoon'

"nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

"Github Copilot
Plug 'github/copilot.vim'

call plug#end()


fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

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
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require('lsp_extensions').inlay_hints{}
augroup END

" WSL yank suppot
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

colorscheme gruvbox
"highlight Low guibg=none



lua << EOF
require('monkishrex')
EOF
