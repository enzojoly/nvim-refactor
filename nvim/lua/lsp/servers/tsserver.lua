-- Configuration for TypeScript Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').tsserver.setup({
        on_attach = function(client, bufnr)
            -- Disable tsserver formatting if you plan on formatting via null-ls
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- Call the provided on_attach function
            on_attach(client, bufnr)

            -- Additional TypeScript specific keybindings can be added here
            local opts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set("n", "<leader>ti", ":TypescriptAddMissingImports<CR>", opts)
            vim.keymap.set("n", "<leader>to", ":TypescriptOrganizeImports<CR>", opts)
            vim.keymap.set("n", "<leader>tu", ":TypescriptRemoveUnused<CR>", opts)
        end,
        capabilities = capabilities,
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                }
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                }
            }
        },
        root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        -- Enable this to enable completion of require/imports
        -- completion = {
        --     completeFunctionCalls = true
        -- },
    })
end

return M
