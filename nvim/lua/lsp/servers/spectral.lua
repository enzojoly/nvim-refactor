-- Configuration for Spectral (OpenAPI/AsyncAPI) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').spectral.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"yaml", "json"},
        root_dir = require('lspconfig').util.root_pattern(".spectral.yaml", ".spectral.yml", ".git"),
    })
end

return M
