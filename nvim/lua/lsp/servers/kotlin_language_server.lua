-- Configuration for Kotlin Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').kotlin_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git"),
        settings = {
            kotlin = {
                compiler = {
                    jvm = {
                        target = "1.8"
                    }
                },
                linting = {
                    debounceTime = 250
                },
                completion = {
                    snippets = {
                        enabled = true
                    }
                }
            }
        }
    })
end

return M
