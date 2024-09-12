-- Configuration for Clojure Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').clojure_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"clojure", "edn"},
        root_dir = require('lspconfig').util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git"),
        settings = {
            clojureLsp = {
                signatureHelp = true,
                completion = {
                    deepCompletion = true,
                    fuzzyCompletion = true,
                }
            }
        }
    })
end

return M
