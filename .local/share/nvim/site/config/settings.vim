set shell=/bin/bash
set nocompatible               " be iMproved

" enable 256 colors
" set t_Co=256

" Required for operations modifying multiple buffers like rename.
set hidden

" Default Indentation Settings
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

" Automatically write file for some commands, like cfile
set autowrite

" show lines numbers
set relativenumber
set number

" enable real-time searching
set incsearch

" highlight search matches
set hlsearch

set completeopt=menuone,menu,longest

set history=1000
set nospell
set pastetoggle=<F12>

" status lines -- note this is not used when airline is enabled
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\ " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Ignore files
set wildignore+=*/.git/*,*.cache,*.swp,*.swo,**/cache/**,*.min.js

" Only get tags from CWD
set tags=tags;

let g:deoplete#enable_at_startup = 1

 " Configuration for coc.nvim
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2
" End of Configuration suggested for coc.nvim

let g:airline#extensions#ale#enabled = 1

let g:rainbow_active = 1

let g:NERDTreeQuitOnOpen = 1

au BufRead,BufNewFile *.sbt set filetype=scala

" needed for nvim-metals (scala)
set shortmess-=F
