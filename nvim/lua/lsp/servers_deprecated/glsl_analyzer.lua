-- Configuration for GLSL Analyzer Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').glsl_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"glsl"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M
