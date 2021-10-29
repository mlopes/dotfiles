vim.cmd [[packadd packer.nvim]]


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

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
end)

