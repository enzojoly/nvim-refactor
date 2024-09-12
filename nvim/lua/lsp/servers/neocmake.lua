-- Configuration for Neocmake Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').neocmake.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"cmake"},
        root_dir = require('lspconfig').util.root_pattern("CMakeLists.txt", ".git"),
    })
end

return M
