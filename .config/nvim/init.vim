set shell=/bin/bash
set nocompatible               " be iMproved

" enable 256 colors
set t_Co=256

source $HOME/.local/share/nvim/site/config/plugins.vim
source $HOME/.local/share/nvim/site/config/variables.vim
source $HOME/.local/share/nvim/site/config/keybindings.vim

" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically detect filetypes
filetype plugin indent on

" Indentation
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

" set syntax highlighting options.
syntax on

augroup defaultgroup
  " Nerdtree: Close NERDTree if it is the last open buffer
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  autocmd FileType c,cpp,java,php,scala,haskell autocmd BufWritePre <buffer> %s/\s\+$//e

  " Settings for rst / markdown
  autocmd FileType rst setlocal textwidth=78
  autocmd Filetype markdown setlocal textwidth=78
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

scriptencoding utf-8
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
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Ignore files
set wildignore+=*/.git/*,*.cache,*.swp,*.swo,**/cache/**,*.min.js

" Allow hidden buffers
set hidden

" Only get tags from CWD
set tags=tags;


func! AsciiMode()
    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    autocmd BufWritePre * :%s/\s\+$//e
endfu
com! ASC call AsciiMode()

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE

" Color scheme
set background=dark
color gruvbox
hi Normal ctermbg=none
