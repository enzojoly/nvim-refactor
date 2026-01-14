-- plugins/ux/vimtex.lua
-- Configuration for VimTeX plugin

return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_mappings_enabled = false  -- Disable default mappings

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", {
          buffer = true,
          desc = "VimTeX Compile"
        })
      end,
    })
  end,
}
