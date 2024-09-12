-- Configuration for GolangCI-Lint Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').golangci_lint_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {'go', 'gomod'},
        root_dir = require('lspconfig').util.root_pattern('.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json', 'go.mod', '.git'),
        init_options = {
            command = { "golangci-lint", "run", "--out-format", "json" },
        }
    })
end

return M
