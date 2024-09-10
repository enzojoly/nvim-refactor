-- plugins/lazygit.lua
-- Configuration for lazygit plugin

return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "LazyGit",
  config = function()
    vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
  end,
}
