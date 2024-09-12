-- Configuration for Docker Compose Language Service
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').docker_compose_language_service.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "yaml.docker-compose" },
        root_dir = require('lspconfig').util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
        settings = {
            telemetry = {
                enabled = false,
            },
        },
    })
end

return M
