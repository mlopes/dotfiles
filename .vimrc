set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

" enable 256 colors
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/fzf
let g:vundle_default_git_proto = 'git'
call vundle#begin()

" =============================== "
" ======== Vundle Config ======== "

Plugin 'tpope/vim-surround'

" Utility bundles
Plugin 'L9'
Plugin 'vim-scripts/tlib'
Plugin 'Shougo/vimproc.vim'
Plugin 'chase/vim-ansible-yaml'

" Preview images in ASCII
" Plugin 'ashisha/image.vim'

" Aligning
Plugin 'godlygeek/tabular'

" Plugin 'austintaylor/vim-commaobject'
" Plugin 'beberlei/vim-php-refactor'

" RST Tables
"Plugin 'nvie/vim-rst-tables'

" Generate PHPUnit tests
Plugin 'dantleech/vim-phpunit'

" Determine the namespace for the current file
Plugin 'dantleech/vim-phpnamespace'

" Color scheme
" Plugin 'vim-scripts/twilight256.vim.git'
" Plugin 'tomasr/molokai'

" Grep buffers
Plugin 'Buffer-grep'

" Easy motion - <Leader>ww = forward, <Leader>bb = backwards
" Plugin 'Lokaltog/vim-easymotion'

" Best snippets plugin
Plugin 'Sirver/ultisnips'

" Package manager
Plugin 'gmarik/vundle'

" phpcsfixer integration
Plugin 'stephpy/vim-php-cs-fixer'

" pdv - php documentor (docblocks)
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Plugin 'kien/ctrlp.vim'

" Twig syntax highlighting
Plugin 'evidens/vim-twig'

" Tag bar shows methods and variables of current class (uses ctags)
" Plugin 'majutsushi/tagbar'

" Better javascript support
Plugin 'pangloss/vim-javascript'

" Nerdtree file browser
Plugin 'scrooloose/nerdtree'

" Easily comment - <Leader>cc
Plugin 'scrooloose/nerdcommenter'

" Syntax checking on write
Plugin 'scrooloose/syntastic'

" Powerful PHP completion (uses ctags)
Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'm2mdas/phpcomplete-extended' <-- nice, users composer. almost ideal. but buggy and adds latency when loading

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Allows text replacement regardless of CaSe
Plugin 'tpope/vim-abolish'

" GiT integration: Gblame, Gread (reset to git state), Gstatus
Plugin 'tpope/vim-fugitive'

" Automatically insert use statements and expand class names to FQN
Plugin 'arnaud-lb/vim-php-namespace'

" Align anything
" Plugin 'junegunn/vim-easy-align'

" Get GITHub activity
Plugin 'junegunn/vim-github-dashboard'

" PHP Documentation - hit K (shift-k) on any php function
Plugin 'mudpile45/vim-phpdoc'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plugin 'henrik/vim-qargs'

" PHPSpec integration
" Plugin 'Herzult/phpspec-vim.git'

" Tern javascript thing
Plugin 'marijnh/tern_for_vim'

" Vdebug - PHP debugging
Plugin 'joonty/vdebug'

" phpunit skelgen
" Plugin 'TsonJgoku/vim-phpunit-skelgen'

" Cool status bar
" Plugin 'bling/vim-airline'  # slow...

" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Refactoring
Plugin 'adoy/vim-php-refactoring-toolbox'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Argument wrapping and unwrapping
Plugin 'FooSoft/vim-argwrap'

" Search highlighting
" Plugin 'timakro/vim-searchant'


call vundle#end()

" =============================== "
" =========== Config ============ "

" show TWIG highlighting
au BufRead,BufNewFile *.twig set syntax=htmljinja

" Automatically detect filetypes
filetype plugin indent on

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
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

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let g:padawan#composer_command = "composer"
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0


" set syntax highlighting options.
syntax on
let c_space_errors = 1
let php_sql_query = 1
let php_sync_method = 0
let php_folding=0
let g:DisableAutoPHPFolding = 1

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

" show TWIG highlighting
" au BufRead,BufNewFile *.twig set syntax=htmljinja

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
    " set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Ignore files
set wildignore+=*/.git/*,*.cache,*.cache.php,*.swp,*.swo,**/cache/**,*.min.js

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
let g:snips_author="Daniel Leech <daniel@dantleech.com>"

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php'] " , 'phpcs', 'phpmd']

" php,pec-vim
"
let g:phpspec_run_cmd_options = '--verbose -fpretty'

" Only get tags from CWD
set tags=tags;
set tags+=/usr/share/php/PHPUnit/tags
" let g:phpcomplete_parse_docblock_comments = 1
" let g:phpcomplete_complete_for_unknown_classes = 0

" PHP Compoete extended
" let g:phpcomplete_index_composer_command="composer"

" Settings for rst / markdown
autocmd FileType rst setlocal textwidth=78
autocmd Filetype markdown setlocal textwidth=78
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php setlocal omnifunc=phpactor#complete

" Settings for php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/phpcsfixer"

" UltiSnips
let g:UltiSnipsSnippetsDir="/home/daniel/.vim/UltiSnips/"
let g:UltiSnipsExpandTrigger="<c-c>"

" ======================== "
" Neo complete config
" ======================== "
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" phpunit test directory
let g:phpunit_testroot = 'tests'


" Color scheme
" color twilight256
color mustango
" color molokai
" let g:rehash256 = 1
" let g:molokai_original = 1

" PDV config
let g:pdv_template_dir = "/home/daniel/.vim/pdv_templates_snip"

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
map <Leader>t :TagbarToggle <CR>

" Automatically add a use statement for class under cursor (uses ctags)
map <Leader>u :call PhpInsertUse()<CR>

" Expand the class under the cursor (uses ctags)
map <Leader>e :call PhpExpandClass()<CR>

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
map <Leader>vr :so ~/.vimrc<CR>

" Edit .vimrc
map <Leader>ve :tabnew ~/.vimrc<CR>

" Next quick fix item
map <Leader>= :cnext<CR>

" Previous quick fix item
map <Leader>- :cprev<CR>

" PHPCs Fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" PDV PhpDocumentor
nnoremap <silent><leader>dd :call pdv#DocumentWithSnip()<CR>

" Remap C-w C-w to C-w C-o, like in tmux
nnoremap <C-w><C-o> <C-w><C-w>
nnoremap <C-w>o <C-w><C-w>

" Generate missing method
nnoremap <silent><leader>mm :call phpactor#generate_snippet("implement_missing_methods")<CR>
nnoremap <silent><leader>mp :call phpactor#generate_snippet("implement_missing_properties")<CR>

" Generate PHPUnit test cases
nnoremap <silent><leader>pt :call PhpunitGenerate()<CR>
nnoremap <silent><leader>pp :call PhpunitRun()<CR>

" Insert the current namespace
nnoremap <silent><leader>nn :call PhpNamespaceInsert()<CR>

nnoremap <silent> <leader>aw :ArgWrap<CR>

func! AsciiMode()
    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    autocmd BufWritePre * :%s/\s\+$//e
endfu
com! ASC call AsciiMode()

