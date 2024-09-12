-- plugins/lsp_lines.lua
-- Configuration for lsp_lines plugin

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()

    -- Disable virtual_text since it's redundant due to lsp_lines.
    vim.diagnostic.config({
      virtual_text = false,
    })

    -- Toggle lsp_lines visibility
    vim.keymap.set(
      "",
      "<Leader>ll",
      require("lsp_lines").toggle,
      { desc = "Toggle lsp_lines" }
    )
  end,
}
