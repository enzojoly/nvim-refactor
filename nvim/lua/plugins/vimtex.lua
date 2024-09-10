-- plugins/vimtex.lua
-- Configuration for VimTeX plugin

return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_mode = 0
  end,
}
