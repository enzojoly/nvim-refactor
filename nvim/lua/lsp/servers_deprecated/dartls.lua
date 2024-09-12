-- Configuration for Dart Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').dartls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("pubspec.yaml", ".git"),
        init_options = {
            closingLabels = true,
            flutterOutline = true,
            onlyAnalyzeProjectsWithOpenFiles = true,
            outline = true,
            suggestFromUnimportedLibraries = true
        },
        settings = {
            dart = {
                completeFunctionCalls = true,
                showTodos = true
            }
        }
    })
end

return M
