-- Configuration for Jedi Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        -- Jedi specific settings
        init_options = {
            workspaceSymbols = {
                enabled = true,
                searchAllScopes = true,
            },
            completion = {
                disableSnippets = false,
                resolveEagerly = false,
            },
            diagnostics = {
                enable = true,
                didOpen = true,
                didChange = true,
                didSave = true,
            },
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
    })
end

return M
