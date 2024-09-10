-- plugins/nerdtree.lua
-- Configuration for NERDTree plugin

return {
  "preservim/nerdtree",
  cmd = "NERDTreeToggle",
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeMinimalUI = 1
    vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
