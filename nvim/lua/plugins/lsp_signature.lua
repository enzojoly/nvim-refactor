-- plugins/lsp_signature.lua
-- Configuration for lsp_signature plugin

return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    doc_lines = 10,
    floating_window = true,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = "🐼 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = "rounded"
    },
    always_trigger = false,
    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,
    padding = '',
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = 'Black',
    timer_interval = 200,
    toggle_key = nil
  },
  config = function(_, opts) require'lsp_signature'.setup(opts) end
}
