set number
set expandtab
set softtabstop=4
set ignorecase
set smartcase
syntax on
"map <C-S-y> "+y
"map <C-S-p> "+P
"nnoremap <C-S-y> :call system("wl-copy", @")<CR>
xnoremap <silent> <C-S-y> :w !wl-copy<CR><CR>
set fillchars=eob:\ ,
set noshowmode
