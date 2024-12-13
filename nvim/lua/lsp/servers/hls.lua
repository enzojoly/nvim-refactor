-- Configuration for Haskell Language Server
local M = {}
function M.setup(on_attach, capabilities)
    require('lspconfig').hls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "haskell", "lhaskell", "cabal" },
        root_dir = require('lspconfig').util.root_pattern(
            "*.cabal", "stack.yaml", "cabal.project",
            "package.yaml", "hie.yaml", ".git"
        ),
        settings = {
            haskell = {
                formattingProvider = "ormolu",
                checkProject = true,
            }
        }
    })
end

return M
