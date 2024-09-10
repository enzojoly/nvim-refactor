-- plugins/mini-icons.lua
-- Configuration for mini.nvim icons

return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.icons').setup()
  end
}
