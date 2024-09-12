-- Configuration for SVLS (SystemVerilog) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').svls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"systemverilog", "verilog"},
        root_dir = require('lspconfig').util.root_pattern(".git"),
    })
end

return M