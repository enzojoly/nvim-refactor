-- Configuration for Zig Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').zls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"zls"},
        filetypes = {"zig"},
        root_dir = require('lspconfig').util.root_pattern("build.zig", ".git"),
        single_file_support = true,
    })
end

return M
