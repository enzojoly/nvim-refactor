-- Configuration for R Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').r_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern(".git"),
        settings = {
            r = {
                lsp = {
                    diagnostics = true,
                    rich_documentation = true
                }
            }
        }
    })
end

return M
