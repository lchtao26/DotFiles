-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself
  use 'github/copilot.vim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dispatch'

  use 'justinmk/vim-sneak'
  use 'sheerun/vim-polyglot'
  use 'chemzqm/wxapp.vim'
  use 'navarasu/onedark.nvim'
  use 'AndrewRadev/splitjoin.vim'
  use 'bronson/vim-visual-star-search'
  use 'windwp/nvim-autopairs'
  use 'andymass/vim-matchup'
  vim.api.nvim_set_var('matchup_matchparen_enabled', 0)
  use {
    'declancm/maximize.nvim',
    config = function() require('maximize').setup() end
  }

  use 'junegunn/fzf'
  use 'preservim/nerdtree'
  vim.api.nvim_set_var('NERDTreeWinPos', 'bottom')
  vim.api.nvim_set_var('NERDTreeQuitOnOpen', 1)

  use 'dyng/ctrlsf.vim'
  vim.api.nvim_set_var('ctrlsf_default_view_mode', 'compact')
  vim.api.nvim_set_var('ctrlsf_populate_qflist', 1)
  vim.api.nvim_set_var('ctrlsf_backend', 'ag')


  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
