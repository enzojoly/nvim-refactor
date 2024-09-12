-- Configuration for TOML Language Server (Taplo)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').taplo.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"toml"},
        settings = {
            taplo = {
                diagnostics = {
                    enable = true,
                    disabled = {},
                    warningAsHint = {},
                    warningAsInfo = {},
                },
                formatter = {
                    alignEntries = false,
                    alignComments = false,
                    columnWidth = 80,
                    indentTables = false,
                    indentString = "  ",
                    reorderKeys = false,
                },
            }
        }
    })
end

return M
