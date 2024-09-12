-- Configuration for Pyright Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                },
            },
        },
        -- Pyright specific flags
        flags = {
            debounce_text_changes = 150,
        },
        -- Root directory patterns
        root_dir = require('lspconfig').util.root_pattern(
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            ".git"
        ),
        -- Single file support
        single_file_support = true,
    })
end

return M
