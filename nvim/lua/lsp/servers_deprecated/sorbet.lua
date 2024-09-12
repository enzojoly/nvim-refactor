-- Configuration for Sorbet (Ruby) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').sorbet.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"ruby"},
        root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git"),
        settings = {
            sorbet = {
                enabled = true,
                diagnosticMode = "all",
            }
        }
    })
end

return M
