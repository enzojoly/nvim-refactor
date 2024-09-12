-- Configuration for Prisma Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').prismals.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"prisma"},
        root_dir = require('lspconfig').util.root_pattern(".git", "package.json"),
    })
end

return M
