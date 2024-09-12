-- Configuration for TFLint (Terraform Linter) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').tflint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"terraform", "tf"},
        root_dir = require('lspconfig').util.root_pattern(".tflint.hcl", ".git"),
    })
end

return M
