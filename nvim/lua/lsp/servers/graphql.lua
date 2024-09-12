-- Configuration for GraphQL Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').graphql.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
        root_dir = require('lspconfig').util.root_pattern('.graphqlrc', '.graphql.config.js', '.graphqlrc.yml', '.graphqlrc.yaml', '.graphqlrc.json', 'graphql.config.js', 'graphql.config.yml', 'graphql.config.yaml', 'graphql.config.json'),
    })
end

return M
