-- Configuration for Julia Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').julials.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"julia"},
        settings = {
            julia = {
                lint = {
                    missingrefs = "all",
                    iter = true,
                    lazy = true,
                    modname = true
                },
                format = {
                    indent = 4,
                    max_line_length = 92
                },
                completionmode = "qualify"
            }
        }
    })
end

return M
