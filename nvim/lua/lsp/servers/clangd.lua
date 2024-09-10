-- lsp/servers/clangd.lua
-- Specific configurations for clangd language server

local M = {}

function M.setup()
  require('lspconfig').clangd.setup{
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = require('lspconfig').util.root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    ),
    single_file_support = true,
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
    },
  }
end

return M
