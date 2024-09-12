-- Configuration for V Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').vls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"vlang"},
        root_dir = require('lspconfig').util.root_pattern("v.mod", ".git"),
    })
end

return M
