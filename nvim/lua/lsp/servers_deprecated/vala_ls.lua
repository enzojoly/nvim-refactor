-- Configuration for Vala Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').vala_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"vala"},
        root_dir = require('lspconfig').util.root_pattern("meson.build", ".git"),
    })
end

return M
