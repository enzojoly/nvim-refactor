-- plugins/copilot.lua
-- Configuration for GitHub Copilot

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false, -- Disable default accept keymap
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        lua = true,
        python = true,
        javascript = true,
        typescript = true,
        ["."] = false, -- disable for all unlisted filetypes
      },
    })

    -- Custom keymapping to preserve Tab functionality
    local function accept_suggestion()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end

    vim.keymap.set("i", "<Tab>", accept_suggestion, { expr = false, silent = true })
  end,
}

-- Configuration Overview and Additional Options:
-- 1. Lazy Loading: Uses 'cmd' and 'event' for efficient startup.
-- 2. Suggestion Settings:
--    - Enabled with auto-triggering
--    - Custom keybindings for navigation and dismissal
--    - Tab key is customized to accept suggestions while preserving its default functionality
-- 3. Filetypes: Explicitly enabled for common programming languages, can be adjusted as needed.

-- Additional Configuration Options
-- 1. Panel: Can be configured for viewing multiple suggestions.
--    Example:
--    panel = {
--      enabled = true,
--      auto_refresh = true,
--      keymap = {
--        jump_prev = "[[",
--        jump_next = "]]",
--        accept = "<CR>",
--        refresh = "gr",
--        open = "<M-CR>"
--      },
--    },
-- 2. Suggestion Tweaks:
--    suggestion = {
--      debounce = 75, -- Adjust delay before showing suggestions
--    },
-- 3. Extended Filetypes: Enable/disable for specific file types.
--    filetypes = {
--      yaml = false,
--      markdown = false,
--      help = false,
--      gitcommit = false,
--    },
-- 4. Node.js Version: Specify if needed.
--    copilot_node_command = 'node',
-- 5. Advanced Server Options:
--    server_opts_overrides = {},

-- Adjust these options as your needs evolve. Remember to restart Neovim or reload your
-- configuration after making changes.
