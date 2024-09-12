-- Configuration for Puppet Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').puppet.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"puppet"},
        root_dir = require('lspconfig').util.root_pattern(".git", "manifests"),
        settings = {
            puppet = {
                lint = {
                    enabled = true,
                },
                format = {
                    enabled = true,
                },
            }
        }
    })
end

return M
