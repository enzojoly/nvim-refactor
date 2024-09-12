-- Configuration for Teal Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').teal_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"teal"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
