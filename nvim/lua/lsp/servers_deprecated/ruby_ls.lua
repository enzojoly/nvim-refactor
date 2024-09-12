-- Configuration for Ruby Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').ruby_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"ruby"},
        root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git"),
    })
end

return M
