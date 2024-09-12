-- Configuration for QML Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').qmlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"qml"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
