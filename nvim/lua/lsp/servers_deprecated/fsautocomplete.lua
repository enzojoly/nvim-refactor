-- Configuration for F# Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').fsautocomplete.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"fsharp"},
        root_dir = require('lspconfig').util.root_pattern("*.fsproj", ".git"),
    })
end

return M
