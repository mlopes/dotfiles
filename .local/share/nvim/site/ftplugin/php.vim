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
" Show information about "type" under cursor including current frame
nnoremap <silent><Leader>d :call phpactor#OffsetTypeInfo()<CR>


let g:phpspec_run_cmd_options = '--verbose -fpretty'
let php_sql_query = 1
let php_sync_method = 0
let php_folding=0
let g:DisableAutoPHPFolding = 1

augroup phpgroup
    autocmd!
    autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END
