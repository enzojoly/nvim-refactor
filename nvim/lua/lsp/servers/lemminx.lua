-- Configuration for XML Language Server (LemMinX)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').lemminx.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"xml", "xsd", "xsl", "xslt", "svg"},
        settings = {
            xml = {
                catalogs = {},
                logs = {
                    client = false,
                    server = false
                },
                format = {
                    splitAttributes = true,
                    joinCDATALines = false
                },
                validation = {
                    enabled = true,
                    noGrammar = "hint"
                }
            }
        }
    })
end

return M
