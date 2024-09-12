-- Configuration for Phpactor Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').phpactor.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"php"},
        root_dir = require('lspconfig').util.root_pattern("composer.json", ".git"),
        init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
        }
    })
end

return M
