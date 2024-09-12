-- Configuration for PureScript Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').purescriptls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"purescript"},
        root_dir = require('lspconfig').util.root_pattern("spago.dhall", "psc-package.json", "bower.json", ".git"),
    })
end

return M
