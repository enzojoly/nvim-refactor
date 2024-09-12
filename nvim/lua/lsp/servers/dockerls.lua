-- Configuration for Docker Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "dockerfile" },
        root_dir = require('lspconfig').util.root_pattern("Dockerfile"),
        settings = {
            docker = {
                languageserver = {
                    diagnostics = {
                        enable = true,
                        deprecatedMaintainer = "warning",
                        directiveCasing = "warning",
                        emptyContinuationLine = "warning",
                        instructionCasing = "warning",
                        instructionCmdMultiple = "warning",
                        instructionEntrypointMultiple = "warning",
                        instructionHealthcheckMultiple = "warning",
                        instructionJSONInSingleQuotes = "warning",
                    },
                },
            },
        },
    })
end

return M
