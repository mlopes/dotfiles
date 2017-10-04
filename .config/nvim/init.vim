
source $HOME/.local/share/nvim/site/config/plugins.vim
source $HOME/.local/share/nvim/site/config/settings.vim
source $HOME/.local/share/nvim/site/config/variables.vim
source $HOME/.local/share/nvim/site/config/keybindings.vim

" Automatically detect filetypes
filetype plugin indent on


" set syntax highlighting options.
syntax on

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
augroup END

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

scriptencoding utf-8

func! AsciiMode()
    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    autocmd BufWritePre * :%s/\s\+$//e
endfu

com! ASC call AsciiMode()

" Color scheme
set background=dark
color gruvbox

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
