-- plugins/lsp/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- This should now be handled by lsp/handler.lua
    -- You can keep any global LSP settings here if needed
  end
}
