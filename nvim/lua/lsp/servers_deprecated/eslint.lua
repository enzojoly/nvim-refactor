-- Configuration for ESLint Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').eslint.setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            -- Automatically fix ESLint errors on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end,
        capabilities = capabilities,
        filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue"},
        settings = {
            codeAction = {
                disableRuleComment = {
                    enable = true,
                    location = "separateLine"
                },
                showDocumentation = {
                    enable = true
                }
            },
            codeActionOnSave = {
                enable = true,
                mode = "all"
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            packageManager = "npm",
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = false,
            validate = "on",
            workingDirectory = {
                mode = "location"
            }
        }
    })
end

return M
