-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')

require('plugins/mason-lspconfig')
require('plugins/nvim-cmp')
require('plugins/nvim-autopairs')

require('custom')
