" =============================== "
" ======= Plugin Imports ======== "

let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.local/share/nvim/plugged'))

" General fuzzy search capability
Plug 'junegunn/fzf', { 'dir': '~/.local/bin/fzf', 'do': './install --all' }

" Some surrounding characters trickery (not sure if should keep it)
Plug 'tpope/vim-surround'

" Aligning - TODO - Check if it's doing any usefull stuff
Plug 'godlygeek/tabular'

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

" Tmux focus events support
Plug 'tmux-plugins/vim-tmux-focus-events'

" Scala plugins
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Syntaxe check and linting - Being used for PHP, Scala and Haskell
Plug 'w0rp/ale'

Plug 'morhetz/gruvbox'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neomake/neomake'

Plug 'majutsushi/tagbar'

" Initialize plugin system
call plug#end()
