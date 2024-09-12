-- Configuration for CSS Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "css", "scss", "less" },
        settings = {
            css = {
                validate = true
            },
            less = {
                validate = true
            },
            scss = {
                validate = true
            }
        }
    })
end

return M
