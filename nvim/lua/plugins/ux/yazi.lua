-- plugins/ux/yazi.lua
-- Configuration for yazi plugin

return {
  'sxyazi/yazi',
  config = function()
    -- Add any Yazi-specific configuration here
    -- Note: Yazi is primarily a terminal file manager, so most configuration might be done outside of Neovim
    vim.keymap.set('n', '<leader>y', ':!yazi<CR>', { noremap = true, silent = true })
  end
}
