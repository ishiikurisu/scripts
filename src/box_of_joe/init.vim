call plug#begin()
Plug 'Olical/conjure'
call plug#end()
colorscheme brogrammer
syntax on
set number
set background=dark
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype clojure setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4

