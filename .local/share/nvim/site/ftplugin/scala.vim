let g:ale_linters.scala = ['scalac', 'scalastyle']

augroup scalagroup
  autocmd BufWritePost *.scala silent :EnTypeCheck
augroup END

