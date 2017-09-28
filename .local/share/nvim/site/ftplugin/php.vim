nnoremap <Leader>u :call phpactor#UseAdd()<CR>
nnoremap <Leader>e :call phpactor#ClassExpand()<CR>
nnoremap <Leader>o :call phpactor#GotoDefinition()<CR>
nnoremap <Leader>pd :call phpactor#OffsetTypeInfo()<CR>
nnoremap <Leader>pfm :call phpactor#MoveFile()<CR>
nnoremap <Leader>pfc :call phpactor#CopyFile()<CR>
nnoremap <Leader>tt :call phpactor#Transform()<CR>
nnoremap <Leader>cc :call phpactor#ClassNew()<CR>
nnoremap <Leader>fr :call phpactor#FindReferences()<CR>
nnoremap <silent><leader>mm :call phpactor#generate_snippet("implement_missing_methods")<CR>
nnoremap <silent><leader>mp :call phpactor#generate_snippet("implement_missing_properties")<CR>

" PHPCs Fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
"
" Insert the current namespace
nnoremap <silent><leader>nn :call PhpNamespaceInsert()<CR>
"
" Show information about "type" under cursor including current frame
nnoremap <silent><Leader>d :call phpactor#OffsetTypeInfo()<CR>

autocmd FileType php setlocal omnifunc=phpactor#Complete

" Settings for php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/phpcsfixer"

" php,pec-vim
"
let g:phpspec_run_cmd_options = '--verbose -fpretty'

let php_sql_query = 1
let php_sync_method = 0
let php_folding=0
let g:DisableAutoPHPFolding = 1
