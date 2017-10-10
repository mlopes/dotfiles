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

