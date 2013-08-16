"
""""""""""""""""""""""""""""""""""""""""
"
"  HIGHLIGHTING
"
syntax on
colo mustango
se cursorline
se listchars=tab:▸\ ,trail:□,eol:¬

"
""""""""""""""""""""""""""""""""""""""""
"
"  ENVIRONMENT
"
se encoding=utf8
se backspace=2
se fileformat=unix
se fileformats=unix
se nocompatible
se hidden
se nobackup
se noswapfile
se dir=/tmp,/var/tmp
se autoread
se number
se visualbell
se ch=1
se laststatus=2
se noshowmode
se mousehide
se ttyfast
se autoindent
se copyindent
se smartindent
se smarttab
se nolist
se backspace=indent,eol,start
se wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/web/bundles,.DS_Store
se path=**

"
""""""""""""""""""""""""""""""""""""""""
"
"  FOLDING
"
se foldmethod=syntax
se foldlevel=1

"
""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH
"
se incsearch
se hlsearch
se showmatch
se ignorecase
se smartcase
se gdefault
se tags+=vendor.tags

"
""""""""""""""""""""""""""""""""""""""""
"
"  SCROLLING
"
se scrolljump=3
se scrolloff=3

"
""""""""""""""""""""""""""""""""""""""""
"
"  TABS
"
se tabstop=4
se shiftwidth=4
se softtabstop=4
se showtabline=1
se expandtab

""""""""""""""""""""""""""""""""""""""""
"
"  WRAPPING
"
se wrap
se linebreak
se textwidth=100
se colorcolumn=100
se formatoptions=qrn1


"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > CUSTOM FUNCTIONS
"|
"|
""""""""""""""""""""""""""""""""""""""""
"
"  STRIP TRAILING SPACES
"
nnoremap <silent> <leader>c :call <sid>StripTrailingWhitespaces()<cr>
function! <sid>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"
""""""""""""""""""""""""""""""""""""""""
"
"  RENAME CURRENT BUFFER FILE
"
nnoremap <leader>mv :Rename %:p:h<tab>
command! -nargs=1 -complete=file Rename call <sid>Rename(<q-args>)
function! <sid>Rename(newfile)
    let l:newfile = a:newfile
    let l:oldfile = expand('%:p')

    exe 'saveas! '.l:newfile
    call system('rm '.shellescape(l:oldfile))

    let l:lastbuf = bufnr(l:oldfile)
    exe 'bd! '.l:lastbuf
endfunction

"
""""""""""""""""""""""""""""""""""""""""
"
"  CREATE DIRECTORY FOR CURRENT BUFFER
"
function! <sid>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction
