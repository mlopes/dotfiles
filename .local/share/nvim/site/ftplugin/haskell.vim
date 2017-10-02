let g:ale_linters = {'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools']}

let g:haskellmode_completion_ghc = 1

let g:haskell_tabular = 1

augroup haskellgroup
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

" Ignore files
set wildignore+=.cabal-sandbox
set wildmode=longest,list,full
set wildmenu

set completeopt=menuone,menu,longest

set shiftwidth=2
set tabstop=2
set softtabstop=2

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

