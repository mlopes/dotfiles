scriptencoding utf-8

" Automatically detect filetypes
filetype plugin indent on

source $HOME/.local/share/nvim/site/config/plugins.vim
source $HOME/.local/share/nvim/site/config/settings.vim
source $HOME/.local/share/nvim/site/config/variables.vim
source $HOME/.local/share/nvim/site/config/keybindings.vim
source $HOME/.local/share/nvim/site/config/autocmds.vim

" set syntax highlighting options.
syntax on

" Color scheme
set background=dark
color gruvbox

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
