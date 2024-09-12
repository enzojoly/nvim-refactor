-- Configuration for Svelte Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').svelte.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "svelte" },
        settings = {
            svelte = {
                plugin = {
                    html = {
                        completions = {
                            enable = true,
                            emmet = true,
                        },
                    },
                    svelte = {
                        completions = {
                            enable = true,
                        },
                    },
                    css = {
                        completions = {
                            enable = true,
                            emmet = true,
                        },
                    },
                },
            },
        },
    })
end

return M
