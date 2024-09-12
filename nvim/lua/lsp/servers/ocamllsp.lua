-- Configuration for OCaml Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').ocamllsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
        settings = {
            codelens = {
                enable = true
            },
            extendedHover = {
                enable = true
            }
        }
    })
end

return M
