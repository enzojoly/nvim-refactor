-- lsp/servers/texlab.lua
-- Specific configurations for LaTeX language server

local M = {} -- Module table

-- Setup function for texlab
-- This function will be called by the main LSP handler
-- @param on_attach function: Common on_attach function for all LSP servers
-- @param capabilities table: Capabilities of the LSP client
function M.setup(on_attach, capabilities)
  require('lspconfig').texlab.setup{
    -- Attach the common on_attach function
    on_attach = on_attach,

    -- Use the capabilities provided by the main LSP handler
    capabilities = capabilities,

    -- Settings specific to texlab
    settings = {
      texlab = {
        -- Directory for auxiliary LaTeX files
        auxDirectory = ".",

        -- Formatter to use for BibTeX files
        bibtexFormatter = "texlab",

        -- Build configuration
        build = {
          -- Arguments for the LaTeX build command
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },

          -- LaTeX build tool to use
          executable = "latexmk",

          -- Whether to perform forward search after building
          forwardSearchAfter = false,

          -- Whether to build on save
          onSave = false
        },

        -- chktex configuration (LaTeX linter)
        chktex = {
          -- Whether to run chktex on edit
          onEdit = false,

          -- Whether to run chktex on open and save
          onOpenAndSave = false
        },

        -- Delay before showing diagnostics (in milliseconds)
        diagnosticsDelay = 300,

        -- Maximum line length for formatting
        formatterLineLength = 80,

        -- Configuration for forward search (from source to PDF)
        forwardSearch = {
          args = {}
        },

        -- Formatter to use for LaTeX files
        latexFormatter = "latexindent",

        -- Configuration for latexindent
        latexindent = {
          -- Whether to modify line breaks during formatting
          modifyLineBreaks = false
        }
      }
    }
  }
end

return M
