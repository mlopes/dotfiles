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

" Aligning - TODO - Check if it's doing any usefull stuff
Plug 'godlygeek/tabular'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Plug 'kien/ctrlp.vim'

" Easily comment - <Leader>cc
Plug 'scrooloose/nerdcommenter'

" Git support
Plug 'tpope/vim-fugitive'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plug 'henrik/vim-qargs'

" Airline status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Argument wrapping and unwrapping
Plug 'FooSoft/vim-argwrap'

" Tmux focus events support
Plug 'tmux-plugins/vim-tmux-focus-events'

" Scala plugins
"Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'derekwyatt/vim-scala'

Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'
Plug 'mpickering/hlint-refactor-vim'

" Syntaxe check and linting - Being used for PHP, Scala and Haskell
" Plug 'w0rp/ale'

Plug 'gruvbox-community/gruvbox'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neomake/neomake'

Plug 'liuchengxu/vim-which-key'

Plug 'majutsushi/tagbar'

Plug 'chrisbra/Colorizer'

Plug 'luochen1990/rainbow'

" Plug 'YorickPeterse/happy_hacking.vim'

" Plug 'ntk148v/vim-horizon'

Plug 'mlopes/vim-farin'

" Initialize plugin system
call plug#end()
