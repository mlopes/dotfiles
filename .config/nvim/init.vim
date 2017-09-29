set shell=/bin/bash
set nocompatible               " be iMproved
" filetype off                   " required!
filetype plugin indent on

" enable 256 colors
set t_Co=256

let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.local/share/nvim/plugged'))

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Completion integration with nvim-completion-manager.
Plug 'roxma/nvim-completion-manager'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

Plug 'tpope/vim-surround'

" Aligning
Plug 'godlygeek/tabular'

" Colour scheme
Plug 'tomasr/molokai'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Plug 'kien/ctrlp.vim'

" Nerdtree file browser
Plug 'scrooloose/nerdtree'

" Easily comment - <Leader>cc
Plug 'scrooloose/nerdcommenter'

" Syntax checking on write
" Plug 'scrooloose/syntastic'

Plug 'tpope/vim-fugitive'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plug 'henrik/vim-qargs'

" Vdebug - PHP debugging
Plug 'joonty/vdebug'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Argument wrapping and unwrapping
Plug 'FooSoft/vim-argwrap'

" Bats support
Plug 'vim-scripts/bats.vim'

"" Snippets
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

" Haskell pluggins
" Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim'

Plug 'ensime/ensime-vim'
Plug 'derekwyatt/vim-scala'

" Syntaxe check and linting - Being used for PHP and Haskell
Plug 'w0rp/ale'

" PHP plugins
" requires phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
Plug 'roxma/ncm-phpactor'
Plug 'majutsushi/tagbar'
" Refactoring
Plug 'adoy/vim-php-refactoring-toolbox'
" PHPSpec integration
Plug 'rafi/vim-phpspec'
" PHP Documentation - hit K (shift-k) on any php function
Plug 'mudpile45/vim-phpdoc'
" Twig syntax highlighting
Plug 'lumiliet/vim-twig'


" Initialize plugin system
call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
"    \ }

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
  

" Automatically detect filetypes
filetype plugin indent on

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=2
set softtabstop=2
set smarttab

" Automatically write file for some commands, like cfile
set autowrite

" show lines numbers
set relativenumber
set number

" enable real-time searching
set incsearch

" highlight search matches
set hlsearch

set completeopt=menuone,menu,longest


let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let g:padawan#composer_command = "composer"
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0


" set syntax highlighting options.
syntax on
let c_space_errors = 1

" Nerdtree: Close NERDTree if it is the last open buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
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
set history=1000
set nospell
set pastetoggle=<F12>

" status lines -- note this is not used when airline is enabled
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\ " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Ignore files
set wildignore+=*/.git/*,*.cache,*.cache.php,*.swp,*.swo,**/cache/**,*.min.js,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

" Allow hidden buffers
set hidden

" CtrlP
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 80
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = ''

" Ultisnip
let g:snips_author="Marco Lopes <marco@mlop.es>"

" Only get tags from CWD
set tags=tags;

" Settings for rst / markdown
autocmd FileType rst setlocal textwidth=78
autocmd Filetype markdown setlocal textwidth=78
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" ======================== "
" Neo complete config
" ======================== "
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0


" Color scheme
" color twilight256
color molokai
" color molokai
" let g:rehash256 = 1
" let g:molokai_original = 1

" Enable powerline fonts
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_section_y = airline#section#create_right(['ffenc', '%o'])


" =============================== "
" ===== Keyboard Mappings ======= "

" Use "," as the <Leader> key
let mapleader=","

" Toggle NERDTree file browser
map <Leader>n :NERDTreeToggle <CR>

" Open current file in NERDTree
map <Leader>f :NERDTreeFind <CR>

" Tagbar shows list of all methods and variables in class
map <Leader>t :TagbarOpenAutoClose <CR>

" Fuzzy search open buffers
map <C-B> :CtrlPBuffer <CR>
" Fuzzy search tags
map <C-T> :CtrlPTag <CR>
" Fuzzy search all project filenames
map <C-F> :FZF <CR>

" map <C-p> :Unite file_rec/async<cr>
" map <C-b> :Unite buffer <cr>
" map <C-t> :Unite tag <cr>
" map <Leader>g :Unite grep:.<cr>

" Update ctags
map <Leader>cp :!ctags --verbose <CR>

" Reload the .vimrc config
map <Leader>vr :so ~/.config/nvim/init.vim<CR>

" Edit .vimrc
map <Leader>ve :tabnew ~/.config/nvim/init.vim<CR>

" Next quick fix item
map <Leader>= :cnext<CR>

" Previous quick fix item
map <Leader>- :cprev<CR>

" PDV PhpDocumentor
nnoremap <silent><leader>dd :call pdv#DocumentWithSnip()<CR>

" Remap C-w C-w to C-w C-o, like in tmux
nnoremap <C-w><C-o> <C-w><C-w>
nnoremap <C-w>o <C-w><C-w>

nnoremap <silent> <leader>aw :ArgWrap<CR>

map <Leader>s :SyntasticToggleMode<CR>
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

nnoremap <localleader>c :EnType<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

autocmd BufWritePost *.scala silent :EnTypeCheck

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync

func! AsciiMode()
    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    autocmd BufWritePre * :%s/\s\+$//e
endfu
com! ASC call AsciiMode()

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
" color mustango
