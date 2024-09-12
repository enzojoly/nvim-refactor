-- Configuration for AWK Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').awk_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"awk"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
