-- Configuration for Ansible Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').ansiblels.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"yaml.ansible"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
