-- Configuration for Perl Navigator
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').perlnavigator.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            perlnavigator = {
                perlPath = 'perl',
                enableWarnings = true,
                perltidyProfile = '',
                perlcriticProfile = '',
                perlcriticEnabled = true,
            }
        }
    })
end

return M
