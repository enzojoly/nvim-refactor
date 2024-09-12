-- Configuration for Remark Language Server (Markdown)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').remark_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"markdown"},
        root_dir = require('lspconfig').util.root_pattern(".git", "package.json"),
        settings = {
            remark = {
                plugins = {
                    -- Add any remark plugins you want to use
                }
            }
        }
    })
end

return M
