syntax on
colorscheme brogrammer
set number
set term=screen-256color

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype clojure setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.fs set syntax=forth

