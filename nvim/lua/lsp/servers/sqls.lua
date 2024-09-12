-- Configuration for SQLS Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').sqls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"sql", "mysql"},
        root_dir = require('lspconfig').util.root_pattern(".sqls.yaml", ".git"),
        settings = {
            sqls = {
                connections = {
                    -- {
                    --     driver = 'mysql',
                    --     dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
                    -- },
                    -- {
                    --     driver = 'postgresql',
                    --     dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=postgres dbname=dvdrental sslmode=disable',
                    -- },
                },
            },
        },
    })
end

return M
