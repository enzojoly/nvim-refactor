-- Configuration for Erlang Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').erlangls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("rebar.config", "erlang.mk", ".git"),
        settings = {
            erlang = {
                inlayHints = {
                    enable = true,
                    paramNameHints = true,
                    typeHints = true,
                    valuesHints = true,
                    variableNameHints = true
                }
            }
        }
    })
end

return M
