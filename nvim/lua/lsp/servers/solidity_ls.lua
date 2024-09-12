-- Configuration for Solidity Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').solidity_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"solidity"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
