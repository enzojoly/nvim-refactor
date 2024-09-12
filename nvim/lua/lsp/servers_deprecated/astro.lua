-- Configuration for Astro Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').astro.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"astro"},
        root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        init_options = {
            configuration = {},
            typescript = {
                serverPath = ''
            }
        }
    })
end

return M
