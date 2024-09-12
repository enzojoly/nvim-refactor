-- Configuration for Crystalline (Crystal) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').crystalline.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"crystal"},
        root_dir = require('lspconfig').util.root_pattern("shard.yml", ".git"),
    })
end

return M
