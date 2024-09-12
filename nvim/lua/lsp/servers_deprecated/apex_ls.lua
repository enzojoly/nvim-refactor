-- Configuration for Apex Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').apex_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"apex"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
