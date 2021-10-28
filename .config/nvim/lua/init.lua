-------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built in
-- LSP. Be sure to thoroughly read the the `:help nvim-metals` docs to get an
-- idea of what everything does.
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmp
--    (needs hrsh7th/vim-vsnip) for snippet support
-- - https://github.com/wbthomason/packer.nvim for package management
-------------------------------------------------------------------------------
local cmd = vim.cmd
local g = vim.g

local function opt(scope, key, value)
  local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

----------------------------------
-- PLUGINS -----------------------
----------------------------------
cmd [[packadd packer.nvim]]


require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- Completion
  use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'steelsojka/pears.nvim'

  use {'hrsh7th/nvim-cmp', requires = {{'hrsh7th/vim-vsnip'}}}
  use 'scalameta/nvim-metals'

  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'RRethy/vim-illuminate' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use 'nvim-lua/lsp-status.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
end)


require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  -- override = {
  --   zsh = {
  --     icon = "",
  --     color = "#428850",
  --     name = "Zsh"
  --   }
  -- };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}

-- nvim tree

g['nvim_tree_ignore'] = { '.git', 'node_modules', '.cache', 'target' } -- empty by default
g['nvim_tree_gitignore'] = 1 -- 0 by default
g['nvim_tree_auto_ignore_ft'] = {} -- [ 'startify', 'dashboard' ] -- empty by default, don't auto open tree on specific filetypes.
g['nvim_tree_quit_on_open'] = 1 -- 0 by default, closes the tree when you open a file
g['nvim_tree_indent_markers'] = 1 -- 0 by default, this option shows indent markers when folders are open
g['nvim_tree_hide_dotfiles'] = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
g['nvim_tree_git_hl'] = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g['nvim_tree_highlight_opened_files'] = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g['nvim_tree_root_folder_modifier'] = ':~' -- This is the default. See :help filename-modifiers for more options
g['nvim_tree_width_allow_resize']  = 1 -- 0 by default, will not resize the tree when opening a file
g['nvim_tree_add_trailing'] = 1 -- 0 by default, append a trailing slash to folder names
g['nvim_tree_group_empty'] = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
g['nvim_tree_disable_window_picker'] = 0 -- 0 by default, will disable the window picker.
g['nvim_tree_special_files'] = { 'README.md', 'Makefile', 'MAKEFILE' } --  List of filenames that gets highlighted with NvimTreeSpecialFile
g['nvim_tree_show_icons'] = { git = 1, folders = 1, files = 1 }

map('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>')
map('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR>')

-- global
opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.o.shortmess = string.gsub(vim.o.shortmess, 'F', '') .. 'c'

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ws', '<cmd>lua require"metals".hover_worksheet()<CR>')
map('n', '<leader>a', '<cmd>lua require"metals".open_all_diagnostics()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>') -- buffer diagnostics only
map('n', '[c', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>')
map('n', ']c', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>')

local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
  completion = {
		completeopt = 'menu,menuone,noinsert',
	},
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
	},
  snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
  mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"]() == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path'     },
		{ name = 'buffer',
			opts = {
				get_bufnrs = function()
					local bufs = {}
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						bufs[vim.api.nvim_win_get_buf(win)] = true
					end
					return vim.tbl_keys(bufs)
				end
			}
		},
		{ name = 'vsnip'    },
	}
}


require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- Hide the root path of the current folder on top of the tree 
    hide_root_folder = false,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- map('i', '<CR>', 'cmp#confirm("\\<CR>")', {expr = true})
-- map('i', '<C-Space>', 'cmp#complete()', {expr = true})

----------------------------------
-- COMMANDS ----------------------
----------------------------------
-- LSP
cmd [[augroup lsp]]
cmd [[autocmd!]]
cmd [[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]]
cmd [[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
cmd [[augroup end]]

-- Need for symbol highlights to work correctly
vim.cmd [[hi! link LspReferenceText CursorColumn]]
vim.cmd [[hi! link LspReferenceRead CursorColumn]]
vim.cmd [[hi! link LspReferenceWrite CursorColumn]]
----------------------------------
-- LSP Setup ---------------------
----------------------------------

local lsp_status = require('lsp-status')
lsp_status.register_progress()


metals_config = require'metals'.bare_config()
-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl'}
}
metals_config.init_options.statusBarProvider = "on"
-- Example of how to ovewrite a handler
metals_config.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = {prefix = ''}})
-- Example if you are including snippets
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = lsp_status.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
metals_config.capabilities = capabilities
metals_config.on_attach = lsp_status.on_attach


require'lspconfig'.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
})

require('lspkind').init()

require('gitsigns').setup()

require'lualine'.setup {
  extensions = {'quickfix', 'nvim-tree', 'fzf'},
  sections = {lualine_c = {"require'lsp-status'.status()", "require'lsp_status'.progress()" }},
  options = {disabled_filetypes = {'presenting_markdown'}},
}

