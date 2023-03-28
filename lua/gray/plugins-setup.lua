local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' 

  use 'sainnhe/everforest'

  use 'tpope/vim-surround' 

  use 'nvim-tree/nvim-tree.lua'

  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  use 'L3MON4D3/luaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  

  use ("williamboman/mason.nvim")
  use ("williamboman/mason-lspconfig.nvim")
  use ("neovim/nvim-lspconfig")
  use ("hrsh7th/cmp-nvim-lsp") 
  use ({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  use ("onsails/lspkind.nvim")
  use ("jose-elias-alvarez/null-ls.nvim")
  use ("jayp0521/mason-null-ls.nvim")  
  
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'windwp/nvim-autopairs'
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
  use 'lewis6991/gitsigns.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
