-- Configuration for Rust Analyzer
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').rust_analyzer.setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            -- Custom keybindings for rust-analyzer
            vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", {buffer = bufnr, desc = "Rust Runnables"})
            vim.keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<cr>", {buffer = bufnr, desc = "Rust Debuggables"})
        end,
        capabilities = capabilities,
        settings = {
            ['rust-analyzer'] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    })
end

return M
