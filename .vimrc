set relativenumber
set showcmd
set number
set expandtab
set softtabstop=5
set ignorecase
set smartcase
syntax on
map <C-S-y> "+y
map <C-S-p> "+P
"xnoremap <silent> <C-S-y> :w !wl-copy<CR><CR>
"set fillchars=eob:\ ,
set noshowmode
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
