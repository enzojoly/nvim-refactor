-- Configuration for Nim Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').nimls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("*.nimble", ".git"),
        settings = {
            nim = {
                projectMapping = {}
            }
        }
    })
end

return M
