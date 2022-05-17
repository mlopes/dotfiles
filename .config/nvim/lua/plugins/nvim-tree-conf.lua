-- nvim tree
vim.g['nvim_tree_auto_ignore_ft'] = {} -- [ 'startify', 'dashboard' ] -- empty by default, don't auto open tree on specific filetypes.
vim.g['nvim_tree_git_hl'] = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g['nvim_tree_highlight_opened_files'] = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g['nvim_tree_root_folder_modifier'] = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g['nvim_tree_width_allow_resize']  = 1 -- 0 by default, will not resize the tree when opening a file
vim.g['nvim_tree_add_trailing'] = 1 -- 0 by default, append a trailing slash to folder names
vim.g['nvim_tree_group_empty'] = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g['nvim_tree_special_files'] = { 'README.md', 'Makefile', 'MAKEFILE', 'build.sbt' } --  List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g['nvim_tree_show_icons'] = { git = 1, folders = 1, files = 1 }

require'nvim-tree'.setup {
  disable_netrw       = true, -- disables netrw completely
  hijack_netrw        = true, -- hijack netrw window on startup
  open_on_setup       = false, -- open the tree when running this setup function
  ignore_ft_on_setup  = {}, -- will not open on setup if the filetype is in this list
  open_on_tab         = false, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  hijack_cursor = false, -- hijack the cursor in the tree to put it at the start of the filename
  update_cwd    = true, -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
  diagnostics = {
    enable = false,
    icons  = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    }
  }, -- show lsp diagnostics in the signcolumn
  filters = {
    dotfiles = false, -- show dotfiles
    custom = { '.git', 'node_modules', '.cache', 'target' }, -- remove some known files and folders
  },
  git = {
    ignore = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  },
  update_focused_file = {
    enable      = false, -- enables the feature
    update_cwd  = true, -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                         -- only relevant when `update_focused_file.enable` is true
    ignore_list = {} -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                     -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
  }, -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  system_open = {
    cmd  = nil, -- the command to run this, leaving nil should work in most cases
    args = {} -- the command arguments as a list
  }, -- configuration options for the system open command (`s` in the tree by default)
  view = {
    width            = 30, -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    height           = 30, -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    hide_root_folder = false, -- Hide the root path of the current folder on top of the tree 
    side             = 'left', -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    mappings = {
      custom_only = false, -- custom only false will merge the list with the default mappings
                           -- if true, it will only use your list to set the mappings
      list        = {} -- list of mappings to set on the tree manually
    }
  }
}

