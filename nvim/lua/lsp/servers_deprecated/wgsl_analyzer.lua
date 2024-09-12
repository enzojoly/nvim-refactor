-- Configuration for WGSL Analyzer Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').wgsl_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"wgsl"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
