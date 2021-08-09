set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" GoTo code navigation.
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gt <Plug>(coc-type-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)

" Format selected text
vnoremap <leader>f <Plug>(coc-format-selected)

lua require('lspinstall').setup()
lua << EOF
    local servers = require('lspinstall').installed_servers()
    for _, server in pairs(servers) do
        require('lspconfig')[server].setup{}
    end
EOF


