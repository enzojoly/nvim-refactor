-- Configuration for Psalm PHP Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').psalm.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"php"},
        root_dir = require('lspconfig').util.root_pattern("psalm.xml", "psalm.xml.dist", ".git"),
    })
end

return M
