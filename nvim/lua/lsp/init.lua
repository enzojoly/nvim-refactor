-- lsp/init.lua
-- LSP configuration entry point

local M = {}

function M.setup()
  require("lsp.handler").setup()

  -- Setup individual language servers
  require("lsp.servers.clangd").setup()
  require("lsp.servers.jdtls").setup()
  require("lsp.servers.texlab").setup()
  -- Add more language servers here
end

return M
