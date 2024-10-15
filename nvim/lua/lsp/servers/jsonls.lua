-- Configuration for JSON Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                end
            }
        },
        settings = {
            json = {
                --schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    })
end

return M
