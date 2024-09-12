-- plugins/dressing.lua
-- Configuration for dressing plugin

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      default_prompt = "➤ ",
      win_options = {
        winhighlight = "Normal:Normal,NormalNC:Normal",
      },
    },
    select = {
      backend = { "telescope", "fzf", "builtin" },
      builtin = {
        win_options = {
          winhighlight = "Normal:Normal,NormalNC:Normal",
        },
      },
    },
  },
}
