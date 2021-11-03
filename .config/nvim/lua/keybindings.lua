local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = "," -- Leader map

vim.api.nvim_set_keymap("n", "<C-B>", ":Telescope buffers<CR>",
  { noremap = true }) -- Fuzzy search open buffers
vim.api.nvim_set_keymap("n",  "<C-F>", ":Telescope find_files<CR>",
  { noremap = true }) -- Fuzzy search all project filenames
vim.api.nvim_set_keymap("n",  "<leader>ff", ":Telescope live_grep<CR>",
  { noremap = true }) -- Fuzzy search in all project files

vim.api.nvim_set_keymap("n", "<CR>",  ":noh<CR><CR>",
  { noremap = true})

vim.api.nvim_set_keymap("n", "<leader>wa", ":ArgWrap<CR>",
  {silent = true, noremap = true})



map('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>')
map('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR>')


map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>')

-- LSP
map('n', 'gd', '<cmd>lua require"telescope.builtin.lsp".definitions()<CR>')
map('n', 'gi', '<cmd>lua require"telescope.builtin.lsp".implementations()<CR>')
map('n', 'gr', '<cmd>lua require"telescope.builtin.lsp".references()<CR>')
map('n', 'gs', '<cmd>lua require"telescope.builtin.lsp".document_symbols()<CR>')
map('n', 'gws', '<cmd>lua require"telescope.builtin.lsp".dynamic_workspace_symbols()<CR>')
map('n', 'gt', '<cmd>lua require"telescope.builtin.lsp".type_definitions()<CR>')
map('n', '<leader>ca', '<cmd>lua require"telescope.builtin.lsp".code_actions(require("telescope.themes").get_cursor({ winblend = 10 }))<CR>')
map('n', '<leader>a', '<cmd>lua require"telescope.builtin.lsp".workspace_diagnostics()<CR>')
map('n', '<leader>d', ':Telescope lsp_document_diagnostics<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>ws', '<cmd>lua require"metals".hover_worksheet()<CR>')
map('n', '[c', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>')
map('n', ']c', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>')


