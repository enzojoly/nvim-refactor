-- Configuration for Groovy Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').groovyls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "java", "-jar", "/path/to/groovy-language-server-all.jar" },
        filetypes = { "groovy" },
        root_dir = require('lspconfig').util.root_pattern("gradlew", ".git"),
        settings = {
            groovy = {
                classpath = {},
                console = "terminal",
            }
        }
    })
end

return M
