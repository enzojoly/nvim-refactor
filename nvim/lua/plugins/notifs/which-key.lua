-- plugins/which-key.lua
-- Configuration for which-key plugin

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your existing options here
    ignore_health_check = { "all" }, -- This line disables all health checks
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- Your existing which-key registrations here
  end,
}
