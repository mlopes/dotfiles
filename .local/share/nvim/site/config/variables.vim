" TODO - Remove this one and set the path in the shell
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

let c_space_errors = 1

let g:padawan#composer_command = "composer"

" NerdTree
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0

" CtrlP
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 80
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = ''

" Ultisnip
let g:snips_author="Marco Lopes <marco@mlop.es>"
"
" ======================== "
" Neo complete config
" ======================== "
"
" TODO - Check if can be moved as neocomplete is replaced by deoplete on
" neovim
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

let g:airline_powerline_fonts = 1
