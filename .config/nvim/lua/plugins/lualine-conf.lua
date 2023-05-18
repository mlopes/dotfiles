require'lualine'.setup {
  extensions = {'quickfix', 'nvim-tree', 'fzf'},
  sections = {lualine_c = {"filename", "require'lsp-status'.status()", "require'lsp-status'.progress()" }},
  options = {
    disabled_filetypes = {'presenting_markdown'},
    globalstatus = true
  },
}
