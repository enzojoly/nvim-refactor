-- Configuration for Assembly Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').asm_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"asm", "s", "S"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
