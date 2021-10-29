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

