-- Configuration for Flow Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').flow.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        root_dir = require('lspconfig').util.root_pattern(".flowconfig", ".git"),
        settings = {
            flow = {
                useNPMPackagedFlow = true,
                pathToFlow = "flow",
            }
        }
    })
end

return M
