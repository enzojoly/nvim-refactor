-- plugins/avante.lua
-- Configuration for avante plugin

return {
  "yetone/avante.nvim",
  branch = "main",
  build = function() require("avante").build() end,
  config = function()
    require("avante").setup({
      -- Configuration options
      -- For example:
      -- model = "gpt-4",
      -- api_key = "your_api_key_here",
    })
  end,
}
