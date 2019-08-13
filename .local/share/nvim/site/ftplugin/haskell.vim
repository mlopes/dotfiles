" let g:ale_linters.haskell = ['stack-build', 'ghc-mod', 'hlint', 'hdevtools']

let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

let g:haskell_tabular = 1

" setlocal omnifunc=necoghc#omnifunc

" Ignore files
setlocal wildignore+=.cabal-sandbox
setlocal wildmode=longest,list,full
setlocal wildmenu

setlocal completeopt=menuone,menu,longest

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tq :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>

let g:ghcmod_use_basedir="/home/mlopes/.local/bin"
