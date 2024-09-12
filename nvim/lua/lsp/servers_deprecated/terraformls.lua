-- Configuration for Terraform Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').terraformls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"terraform", "tf"},
        root_dir = require('lspconfig').util.root_pattern(".terraform", ".git"),
    })
end

return M
