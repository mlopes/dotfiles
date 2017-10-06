let g:ale_linters.scala = ['scalac', 'scalastyle']

nnoremap <Leader>o :EnDeclaration<CR>
nnoremap <Leader>u :EnSuggestImport<CR>
nnoremap <Leader>fr :EnUsages<CR>
nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>

augroup scalagroup
  autocmd BufWritePost *.scala silent :EnTypeCheck
augroup END

