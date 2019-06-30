function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

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
  " Configuration for vim-scala
  au BufRead,BufNewFile *.sbt set filetype=scala
augroup END
