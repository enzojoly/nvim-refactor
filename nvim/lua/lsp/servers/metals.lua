-- Configuration for Metals (Scala) Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').metals.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", ".git"),
        settings = {
            showImplicitArguments = true,
            showInferredType = true,
            excludedPackages = {
                "akka.actor.typed.javadsl",
                "com.github.swagger.akka.javadsl"
            }
        },
        init_options = {
            statusBarProvider = "on",
            inputBoxProvider = true,
            quickPickProvider = true,
            executeClientCommandProvider = true,
            decorationProvider = true,
            didFocusProvider = true,
            slowTaskProvider = true,
            treeViewProvider = true,
            debuggingProvider = true,
        }
    })
end

return M
