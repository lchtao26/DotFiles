-- https://github.com/windwp/nvim-autopairs

local status_ok, plugin = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

plugin.setup({
  disable_in_macro = true,
  disable_in_visualblock = true,
})
