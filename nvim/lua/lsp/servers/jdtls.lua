-- lsp/servers/jdtls.lua
-- Specific configurations for Java language server

local M = {}

function M.setup()
  require('lspconfig').jdtls.setup{
    cmd = {
      'jdtls',
      '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. vim.fn.getcwd(),
    },
    root_dir = require('lspconfig').util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
    settings = {
      java = {
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },
        completion = {
          favoriteStaticMembers = {
            "org.junit.Assert.*",
            "org.junit.Assume.*",
            "org.junit.jupiter.api.Assertions.*",
            "org.junit.jupiter.api.Assumptions.*",
            "org.junit.jupiter.api.DynamicContainer.*",
            "org.junit.jupiter.api.DynamicTest.*",
            "org.mockito.Mockito.*"
          },
          importOrder = {
            "java",
            "javax",
            "com",
            "org"
          }
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
          },
          useBlocks = true,
        },
      }
    },
    init_options = {
      bundles = {}
    },
  }
end

return M
