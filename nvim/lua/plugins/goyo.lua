-- plugins/goyo.lua
-- Configuration for Goyo plugin

return {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  config = function()
    vim.keymap.set('n', '<leader>g', ':Goyo<CR>', { noremap = true, silent = true })
  end,
}
