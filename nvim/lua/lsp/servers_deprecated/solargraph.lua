-- Configuration for Solargraph (Ruby) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').solargraph.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"ruby"},
        root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git"),
        settings = {
            solargraph = {
                diagnostics = true,
                completion = true,
                hover = true,
                formatting = true,
                symbols = true,
                definitions = true,
                rename = true,
                references = true,
                folding = true,
            }
        }
    })
end

return M
