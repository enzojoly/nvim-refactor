-- plugins/winshift.lua
-- Configuration for winshift plugin

return {
  'sindrets/winshift.nvim',
  config = function()
    require("winshift").setup({
      highlight_moving_win = true,  -- Highlight the window being moved
      focused_hl_group = "Visual",  -- The highlight group used for the moving window
      moving_win_options = {
        -- These are local options applied to the moving window while it's
        -- being moved. They are unset when you leave Win-Move mode.
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = "",
      },
      keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        win_move_mode = {
          ["h"] = "left",
          ["j"] = "down",
          ["k"] = "up",
          ["l"] = "right",
          ["H"] = "far_left",
          ["J"] = "far_down",
          ["K"] = "far_up",
          ["L"] = "far_right",
          ["<left>"] = "left",
          ["<down>"] = "down",
          ["<up>"] = "up",
          ["<right>"] = "right",
          ["<S-left>"] = "far_left",
          ["<S-down>"] = "far_down",
          ["<S-up>"] = "far_up",
          ["<S-right>"] = "far_right",
        },
      },
      --window_picker = function()
        -- Custom window picker
      --end,
    })
    vim.keymap.set('n', '<C-W><C-M>', '<Cmd>WinShift<CR>')
    vim.keymap.set('n', '<C-W>m', '<Cmd>WinShift<CR>')
    vim.keymap.set('n', '<C-M-H>', '<Cmd>WinShift left<CR>')
    vim.keymap.set('n', '<C-M-J>', '<Cmd>WinShift down<CR>')
    vim.keymap.set('n', '<C-M-K>', '<Cmd>WinShift up<CR>')
    vim.keymap.set('n', '<C-M-L>', '<Cmd>WinShift right<CR>')
  end
}
