-- Configuration for YAML Language Server
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                    ["https://json.schemastore.org/circleciconfig.json"] = "/.circleci/config.yml",
                },
                validate = true,
                format = {
                    enable = true,
                },
                hover = true,
                completion = true,
                customTags = {
                    "!include",
                    "!reference",
                },
            },
        },
    })
end

return M
