-- Configuration for Bash Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash" },
        root_dir = require('lspconfig').util.find_git_ancestor,
        settings = {
            bashIde = {
                globPattern = "*@(.sh|.inc|.bash|.command)"
            }
        }
    })
end

return M
