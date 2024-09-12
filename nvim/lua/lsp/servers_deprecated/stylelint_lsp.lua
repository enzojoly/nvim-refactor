-- Configuration for Stylelint Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').stylelint_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        settings = {
            stylelintplus = {
                autoFixOnSave = true,
                autoFixOnFormat = true,
                configFile = nil,  -- Path to .stylelintrc file
            }
        }
    })
end

return M
