vim.opt.shell = '/bin/bash'
vim.opt.hidden = true -- Required for operations modifying multiple buffers like rename.
-- Default Indentation Settings
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.autowrite = true -- Automatically write file for some commands, like cfile
-- show lines numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.incsearch = true -- enable real-time searching
vim.opt.hlsearch = true -- highlight search matches
vim.opt.cursorline = true -- Highlight line under cursor. It helps with navigation.
vim.opt.history = 1000
vim.opt.pastetoggle = '<F12>'
vim.opt.completeopt = 'menuone,menu,noinsert,noselect'
vim.opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
vim.opt.signcolumn = 'yes' -- always show signcolumns
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.shortmess:append('c')
vim.opt.shortmess:remove('F')
vim.opt.wildignore:append(',*/.git/*,*.cache,*.swp,*.swo,**/cache/**,*.min.js') -- Ignore files

-- Need for symbol highlights to work correctly
vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]

vim.cmd("syntax on")
vim.opt.background = 'dark'
vim.api.nvim_command("hi! Normal ctermbg=NONE guibg=NONE")
vim.cmd('let NVIM_TUI_ENABLE_TRUE_COLOR=1')
vim.opt.termguicolors = true

vim.cmd("colorscheme melange")
