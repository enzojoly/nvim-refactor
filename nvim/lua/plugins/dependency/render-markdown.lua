-- plugins/render-markdown.lua
-- Configuration for render-markdown plugin

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("render-markdown").setup()
  end,
}
