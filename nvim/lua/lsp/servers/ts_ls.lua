-- ts_ls.lua
local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require('lspconfig')

    lspconfig.ts_ls.setup({
        -- Function to execute when the language server attaches to a buffer
        on_attach = on_attach,

        -- Capabilities supported by the language server
        capabilities = capabilities,

        -- Settings specific to the TypeScript language server
        settings = {
            typescript = {
                -- Enable or configure TypeScript-specific settings here
                -- For diagnostics, default settings are usually sufficient
            },
            javascript = {
                -- Enable or configure JavaScript-specific settings here
                -- For diagnostics, default settings are usually sufficient
            },
        },

        -- Determine the root directory of the project
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    })
end

return M
