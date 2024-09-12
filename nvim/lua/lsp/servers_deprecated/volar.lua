-- Configuration for Volar (Vue 3) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').volar.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
        init_options = {
            typescript = {
                tsdk = '/path/to/your/tsdk'
            },
            languageFeatures = {
                implementation = true,
                references = true,
                definition = true,
                typeDefinition = true,
                callHierarchy = true,
                hover = true,
                rename = true,
                renameFileRefactoring = true,
                signatureHelp = true,
                codeAction = true,
                workspaceSymbol = true,
                completion = {
                    defaultTagNameCase = 'both',
                    defaultAttrNameCase = 'kebabCase',
                    getDocumentNameCasesRequest = false,
                    getDocumentSelectionRequest = false,
                },
            }
        }
    })
end

return M
