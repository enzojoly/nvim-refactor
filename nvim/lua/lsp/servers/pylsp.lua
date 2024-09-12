-- Configuration for Python LSP Server (pylsp)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = {'E501'},  -- Ignore line too long error
                        maxLineLength = 100
                    },
                    jedi_completion = {
                        fuzzy = true
                    },
                    pyflakes = {
                        enabled = true
                    },
                    pylint = {
                        enabled = true,
                        executable = "pylint"
                    },
                    rope_completion = {
                        enabled = true
                    },
                    yapf = {
                        enabled = true
                    }
                }
            }
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
