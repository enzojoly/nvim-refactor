-- Configuration for Intelephense PHP Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').intelephense.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"php"},
        root_dir = require('lspconfig').util.root_pattern("composer.json", ".git"),
        settings = {
            intelephense = {
                files = {
                    maxSize = 1000000;
                };
--                environment = {
--                    phpVersion = "7.4.0";
                };
            };
        },
    })
end

return M
