-- Configuration for Go Language Server (gopls)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},
        root_dir = require('lspconfig').util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
            },
        },
    })
end

return M
