-- Configuration for C# Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').csharp_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"cs"},
        root_dir = require('lspconfig').util.root_pattern("*.sln", "*.csproj", ".git"),
    })
end

return M
