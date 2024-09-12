-- Configuration for HTML Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "htmldjango" },
        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true
            },
            provideFormatter = true
        }
    })
end

return M
