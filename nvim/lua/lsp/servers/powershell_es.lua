-- Configuration for PowerShell Editor Services
local M = {}

function M.setup(on_attach, capabilities)
    require('lspconfig').powershell_es.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"ps1", "psm1", "psd1"},
        bundle_path = '/path/to/PowerShellEditorServices',
    })
end

return M
