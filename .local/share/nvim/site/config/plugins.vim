" =============================== "
" ======= Plugin Imports ======== "

let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.local/share/nvim/plugged'))

" General fuzzy search capability
Plug 'junegunn/fzf', { 'dir': '~/local/bin/.fzf', 'do': './install --all' }

" Some surrounding characters trickery (not sure if should keep it)
Plug 'tpope/vim-surround'

" Aligning - TODO - Check if it's doing any usefull stuff
Plug 'godlygeek/tabular'

" Colour scheme
Plug 'tomasr/molokai'

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
Plug 'ensime/ensime-vim'
Plug 'derekwyatt/vim-scala'
" Play Framework
Plug 'gre/play2vim'
Plug 'othree/html5.vim'

" Syntaxe check and linting - Being used for PHP, Scala and Haskell
Plug 'w0rp/ale'

" Completion as you type - being used for Haskell and PHP
Plug 'roxma/nvim-completion-manager'
" Auto-completion enhancements - being used for Hasekll
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" PHP plugins
" requires phpactor
" Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
" Plug 'roxma/ncm-phpactor'
Plug 'majutsushi/tagbar'
" Refactoring
" Plug 'adoy/vim-php-refactoring-toolbox'
" PHPSpec integration
Plug 'rafi/vim-phpspec'
" PHP Documentation - hit K (shift-k) on any php function
Plug 'mudpile45/vim-phpdoc'
" Twig syntax highlighting
Plug 'lumiliet/vim-twig'
" Vdebug - Debug plugin - Being used for PHP
Plug 'joonty/vdebug'

Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neomake/neomake'

" Elm
Plug 'carmonw/elm-vim'
Plug 'pbogut/deoplete-elm'

" Initialize plugin system
call plug#end()
