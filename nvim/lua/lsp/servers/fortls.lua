-- Configuration for Fortran Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').fortls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"fortran"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M