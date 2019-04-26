" =============================== "
" ===== Keyboard Mappings ======= "

" Use "," as the <Leader> key
let mapleader=","
"
" Toggle NERDTree file browser
nnoremap <Leader>n :NERDTreeToggle <CR>

" Open current file in NERDTree
nnoremap <Leader>f :NERDTreeFind <CR>

" Tagbar shows list of all methods and variables in class
nnoremap <Leader>t :TagbarOpenAutoClose <CR>

" Fuzzy search open buffers
nnoremap <C-B> :CtrlPBuffer <CR>
" Fuzzy search tags
nnoremap <C-T> :CtrlPTag <CR>
" Fuzzy search all project filenames
nnoremap <C-F> :FZF <CR>

" Update ctags
nnoremap <Leader>cp :!ctags --verbose <CR>

" Reload the .vimrc config
nnoremap <Leader>vr :so ~/.config/nvim/init.vim<CR>

" Edit .vimrc
nnoremap <Leader>ve :tabnew ~/.config/nvim/init.vim<CR>

" Next quick fix item
nnoremap <Leader>= :cnext<CR>

" Previous quick fix item
nnoremap <Leader>- :cprev<CR>

" PDV PhpDocumentor
nnoremap <silent><leader>dd :call pdv#DocumentWithSnip()<CR>

" Remap C-w C-w to C-w C-o, like in tmux
nnoremap <C-w><C-o> <C-w><C-w>
nnoremap <C-w>o <C-w><C-w>

nnoremap <silent> <leader>aw :ArgWrap<CR>

nnoremap <localleader>c :EnType<CR>

nnoremap <CR> :noh<CR><CR>

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

vnoremap a= :Tabularize /=<CR>
vnoremap a; :Tabularize /::<CR>
vnoremap a- :Tabularize /-><CR>

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
