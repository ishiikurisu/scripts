call plug#begin()
Plug 'Olical/conjure'
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
colorscheme catpuccin
syntax on
set number
set background=dark
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype clojure setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4
lua require("mason").setup()
lua require("mason-lspconfig").setup()
lua require("lspconfig").clojure_lsp.setup {}

