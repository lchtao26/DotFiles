-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

map('n', '<Tab>', '<C-w>w')

map('n', 'S', ':w<CR>')
map('n', 'Q', ':q<CR>')
map('n', 'L', ':tabnext<CR>')
map('n', 'H', ':tabprevious<CR>')

map('v', 'L', 'u')
map('v', 'u', 'y')

map('n', 'Y', '<Esc>Vy')
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')

map('n', '<leader>,', ':vs $MYVIMRC<CR>')
map('n', '<leader>so', ':source ~/.config/nvim/init.lua<CR>')

map('i', '<S-Tab>', '<Esc>yiWi<<Esc>Emma></<C-r>"><Esc>`ma')
map('n', '<leader>cp', ':let @+=expand("%:~")<CR>')
map('n', '<leader>l', ':vs<CR>')
map('n', '<leader>no', ':vs ~/.Note<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- VSCode
map('n', 'C', ':execute "!code -g " . expand("%:p") . ":" . line(".") . ":" . col(".") . " --folder-uri " . getcwd()<CR>')

-- Prettier
map('n', 'F', ":Dispatch! npx prettier '%' --write<CR>")

-- Terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- CtrlSF
map('n', '<C-f>', ':CtrlSF ')
map('n', '<C-p>', ':call fzf#run(fzf#wrap({"source": "git ls-files", "options": "--reverse"}))<CR>')
map('n', '<leader>p', ':FZF --reverse<CR>')

-- NvimTree
map('n', '<C-n>', ':NERDTreeToggle<CR>')
map('n', '<leader>h', ':NERDTreeFind<CR>')
