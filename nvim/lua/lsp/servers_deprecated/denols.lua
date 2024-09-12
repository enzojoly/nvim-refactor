-- Configuration for Deno Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').denols.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
        root_dir = require('lspconfig').util.root_pattern("deno.json", "deno.jsonc", ".git"),
        init_options = {
            enable = true,
            lint = true,
            unstable = false,
            importMap = nil,
        }
    })
end

return M
