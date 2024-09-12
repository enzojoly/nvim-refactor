-- Configuration for Angular Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').angularls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescript", "html", "typescriptreact", "typescript.tsx"},
        root_dir = require('lspconfig').util.root_pattern("angular.json", ".git"),
    })
end

return M
