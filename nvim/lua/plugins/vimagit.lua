-- plugins/vimagit.lua
-- Configuration for vimagit plugin

return {
  "jreybert/vimagit",
  cmd = "Magit",
  config = function()
    vim.keymap.set('n', '<leader>gs', ':Magit<CR>', { noremap = true, silent = true })
  end,
}
