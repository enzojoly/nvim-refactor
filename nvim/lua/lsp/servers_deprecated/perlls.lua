-- Configuration for Perl Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').perlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            perl = {
                inc = {},
                perlcritic = {
                    enabled = true,
                },
                syntax = {
                    enabled = true,
                    perl5 = true,
                    perl6 = false,
                },
            },
        },
    })
end

return M
