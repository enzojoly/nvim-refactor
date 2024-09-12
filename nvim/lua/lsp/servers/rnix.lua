-- Configuration for Nix Language Server (rnix-lsp)
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').rnix.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"nix"},
        root_dir = require('lspconfig').util.root_pattern(".git", "flake.nix"),
    })
end

return M
