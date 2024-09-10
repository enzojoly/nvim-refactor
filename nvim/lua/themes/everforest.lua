-- themes/everforest.lua
-- Configuration for Everforest color scheme

return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
    vim.cmd.colorscheme 'everforest'

    -- Additional customizations
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { fg = "#FF0000", bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  end,
}
