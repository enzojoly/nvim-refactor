-- Configuration for Elixir Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').elixirls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { vim.fn.expand("~/.elixir-ls/release/language_server.sh") },
        root_dir = require('lspconfig').util.root_pattern("mix.exs", ".git"),
        settings = {
            elixirLS = {
                dialyzerEnabled = true,
                fetchDeps = false,
                enableTestLenses = true,
                suggestSpecs = true
            }
        }
    })
end

return M
