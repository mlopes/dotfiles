local function opt(scope, key, value)
  local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

-- global
opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.o.shortmess = string.gsub(vim.o.shortmess, 'F', '') .. 'c'

-- Need for symbol highlights to work correctly
vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]

vim.cmd("syntax on")
vim.opt.background = 'dark'
vim.api.nvim_command("hi! Normal ctermbg=NONE guibg=NONE")
vim.cmd('let NVIM_TUI_ENABLE_TRUE_COLOR=1')
vim.o.termguicolors = true
vim.cmd("colorscheme gruvbox")

