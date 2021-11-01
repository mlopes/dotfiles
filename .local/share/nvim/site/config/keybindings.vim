" =============================== "
" ===== Keyboard Mappings ======= "

" Fuzzy search open buffers
nnoremap <C-B> :Buffers <CR>
" Fuzzy search all project filenames
nnoremap <C-F> :FZF <CR>

" Reload the .vimrc config
nnoremap <Leader>vr :so ~/.config/nvim/init.vim<CR>

" Edit .vimrc
nnoremap <Leader>ve :tabnew ~/.config/nvim/init.vim<CR>

" Remap C-w C-w to C-w C-o, like in tmux
nnoremap <C-w><C-o> <C-w><C-w>
nnoremap <C-w>o <C-w><C-w>

nnoremap <silent> <leader>aw :ArgWrap<CR>

nnoremap <CR> :noh<CR><CR>

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

nnoremap <silent> <leader> :<c-u>WhichKey  ','<CR>

