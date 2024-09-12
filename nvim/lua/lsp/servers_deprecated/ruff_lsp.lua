-- Configuration for Ruff Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').ruff_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            settings = {
                -- Ruff specific settings
                run = "onType",
                args = {},
                severities = {
                    F = "Error",
                    E = "Error",
                    W = "Warning",
                    C = "Information",
                    B = "Hint",
                    D = "Information",
                    I = "Information",
                },
            }
        },
        -- Root directory patterns
        root_dir = require('lspconfig').util.root_pattern(
            "pyproject.toml",
            "ruff.toml",
            ".ruff.toml",
            ".git"
        ),
    })
end

return M
