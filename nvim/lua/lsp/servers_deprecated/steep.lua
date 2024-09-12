-- Configuration for Steep (Ruby) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').steep.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"ruby"},
        root_dir = require('lspconfig').util.root_pattern("Steepfile", ".git"),
    })
end

return M
