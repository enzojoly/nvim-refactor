-- Configuration for CSS Modules Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').cssmodules_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
        root_dir = require('lspconfig').util.root_pattern("package.json", ".git"),
    })
end

return M
