-- Configuration for Cypher Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').cypher_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"cypher", "cql"},
        root_dir = require('lspconfig').util.root_pattern(".git", "cypher-queries"),
        settings = {
            cypher = {
                formatter = {
                    indentSize = 2
                },
                diagnostics = {
                    enable = true
                },
                completion = {
                    enable = true
                }
            }
        }
    })
end

return M
