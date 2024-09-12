-- Configuration for Racket Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').racket_langserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"racket"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
