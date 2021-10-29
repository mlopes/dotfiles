vim.cmd [[augroup lsp]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]]
vim.cmd [[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
vim.cmd [[augroup end]]

