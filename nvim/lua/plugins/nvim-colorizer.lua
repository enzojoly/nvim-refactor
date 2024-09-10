-- plugins/nvim-colorizer.lua
-- Configuration for nvim-colorizer plugin

return {
  "NvChad/nvim-colorizer.lua",
  event = "BufRead",
  config = function()
    require("colorizer").setup()
  end,
}
