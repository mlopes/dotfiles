" =============================== "
" ======= Plugin Imports ======== "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.local/share/nvim/plugged'))

" General fuzzy search capability
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Some surrounding characters trickery (not sure if should keep it)
Plug 'tpope/vim-surround'

" Easily comment - <Leader>cc
Plug 'scrooloose/nerdcommenter'

" Git support
Plug 'tpope/vim-fugitive'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plug 'henrik/vim-qargs'

" Argument wrapping and unwrapping
Plug 'FooSoft/vim-argwrap'

" Tmux focus events support
" Plug 'tmux-plugins/vim-tmux-focus-events'

" Scala plugins
Plug 'derekwyatt/vim-scala'

Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'
Plug 'mpickering/hlint-refactor-vim'


Plug 'ryanoasis/vim-devicons'

Plug 'liuchengxu/vim-which-key'

Plug 'luochen1990/rainbow'

" Plug 'YorickPeterse/happy_hacking.vim'

" Plug 'ntk148v/vim-horizon'


" Initialize plugin system
call plug#end()
