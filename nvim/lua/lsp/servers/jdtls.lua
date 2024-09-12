-- lsp/servers/jdtls.lua
-- Specific configurations for Java language server

local M = {} -- Module table

-- Setup function for jdtls
-- This function will be called by the main LSP handler
-- @param on_attach function: Common on_attach function for all LSP servers
-- @param capabilities table: Capabilities of the LSP client
function M.setup(on_attach, capabilities)
  require('lspconfig').jdtls.setup{
    -- Attach the common on_attach function
    on_attach = on_attach,

    -- Use the capabilities provided by the main LSP handler
    capabilities = capabilities,

    -- Command to start the jdtls server
    cmd = {
      'jdtls',
      -- Set the data directory for the current workspace
      '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. vim.fn.getcwd(),
    },

    -- Function to determine the root directory of the project
    root_dir = require('lspconfig').util.root_pattern(
      ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
    ),

    -- Settings specific to jdtls
    settings = {
      java = {
        -- Enable signature help
        signatureHelp = { enabled = true },

        -- Preferred decompiler for showing decompiled sources
        contentProvider = { preferred = 'fernflower' },

        -- Completion settings
        completion = {
          -- Static members to always include in completions
          favoriteStaticMembers = {
            "org.junit.Assert.*",
            "org.junit.Assume.*",
            "org.junit.jupiter.api.Assertions.*",
            "org.junit.jupiter.api.Assumptions.*",
            "org.junit.jupiter.api.DynamicContainer.*",
            "org.junit.jupiter.api.DynamicTest.*",
            "org.mockito.Mockito.*"
          },

          -- Order of imports
          importOrder = {
            "java",
            "javax",
            "com",
            "org"
          }
        },

        -- Source settings
        sources = {
          -- Settings for organizing imports
          organizeImports = {
            -- Thresholds for using wildcard imports
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },

        -- Code generation settings
        codeGeneration = {
          -- Template for toString method
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
          },
          -- Use blocks in generated code
          useBlocks = true,
        },
      }
    },

    -- Initial options for jdtls
    init_options = {
      -- Bundles to be loaded by jdtls (empty in this case)
      bundles = {}
    },
  }
end

return M
