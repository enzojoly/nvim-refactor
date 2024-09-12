-- lsp/servers/clangd.lua
-- Specific configurations for clangd language server

local M = {} -- Module table

-- Setup function for clangd
-- This function will be called by the main LSP handler
-- @param on_attach function: Common on_attach function for all LSP servers
-- @param capabilities table: Capabilities of the LSP client
function M.setup(on_attach, capabilities)
  require('lspconfig').clangd.setup{
    -- Attach the common on_attach function
    on_attach = on_attach,

    -- Use the capabilities provided by the main LSP handler
    capabilities = capabilities,

    -- Command to start the clangd server
    -- "--background-index" allows for faster subsequent startups
    cmd = { "clangd", "--background-index" },

    -- File types that clangd should be activated for
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

    -- Function to determine the root directory of the project
    -- This is used to find project-specific configuration files
    root_dir = require('lspconfig').util.root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    ),

    -- Allow clangd to work even in single file mode (no project)
    single_file_support = true,

    -- Initial options for clangd
    init_options = {
      -- Enable file status reporting
      clangdFileStatus = true,

      -- Use placeholders in completion items
      usePlaceholders = true,

      -- Allow completion of headers that are not yet imported
      completeUnimported = true,

      -- Enable semantic highlighting
      semanticHighlighting = true,
    },
  }
end

return M
