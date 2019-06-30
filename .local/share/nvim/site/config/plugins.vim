" =============================== "
" ======= Plugin Imports ======== "

let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.local/share/nvim/plugged'))

" General fuzzy search capability
Plug 'junegunn/fzf', { 'dir': '~/.local/bin/fzf', 'do': './install --all' }

" Some surrounding characters trickery (not sure if should keep it)
Plug 'tpope/vim-surround'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Plug 'kien/ctrlp.vim'

" Nerdtree file browser
Plug 'scrooloose/nerdtree'

" Easily comment - <Leader>cc
Plug 'scrooloose/nerdcommenter'

" Git support
Plug 'tpope/vim-fugitive'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plug 'henrik/vim-qargs'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Argument wrapping and unwrapping
Plug 'FooSoft/vim-argwrap'

" Bats support
Plug 'vim-scripts/bats.vim'

" Tmux focus events support
Plug 'tmux-plugins/vim-tmux-focus-events'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

" Haskell plugins

Plug 'parsonsmatt/intero-neovim'

Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

Plug 'ervandew/supertab'
" Used by Haskell
Plug 'Shougo/vimproc.vim'

" Scala plugins
" Plug 'natebosch/vim-lsc'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}


" Syntaxe check and linting - Being used for PHP, Scala and Haskell
Plug 'w0rp/ale'

" Completion as you type - being used for Haskell and PHP
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'fgrsnau/ncm2-aspell'
" Auto-completion enhancements - being used for Hasekll
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'majutsushi/tagbar'

Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neomake/neomake'

" Elm
Plug 'carmonw/elm-vim'
Plug 'pbogut/deoplete-elm'

" Initialize plugin system
call plug#end()
