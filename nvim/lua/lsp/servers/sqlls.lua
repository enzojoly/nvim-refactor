-- Configuration for SQL Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').sqlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"sql"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
