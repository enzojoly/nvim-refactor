-- Configuration for Vim Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').vimls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        init_options = {
            diagnostic = {
                enable = true,
            },
            indexes = {
                count = 3,
                gap = 100,
                projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                runtimepath = true,
            },
            isNeovim = true,
            iskeyword = "@,48-57,_,192-255,-#",
            runtimepath = "",
            suggest = {
                fromRuntimepath = true,
                fromVimruntime = true,
            },
            vimruntime = "",
        }
    })
end

return M
