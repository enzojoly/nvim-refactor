-- Configuration for Vue Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').vuels.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "vue" },
        init_options = {
            config = {
                vetur = {
                    useWorkspaceDependencies = true,
                    validation = {
                        template = true,
                        style = true,
                        script = true
                    },
                    completion = {
                        autoImport = true,
                        useScaffoldSnippets = true,
                        tagCasing = "kebab"
                    },
                    format = {
                        defaultFormatter = {
                            js = "prettier",
                            ts = "prettier"
                        },
                        defaultFormatterOptions = {},
                        scriptInitialIndent = false,
                        styleInitialIndent = false
                    }
                }
            }
        }
    })
end

return M
