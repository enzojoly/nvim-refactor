-- plugins/tabout.lua
-- Configuration for tabout plugin

return {
  "abecodes/tabout.nvim",
  wants = {'nvim-treesitter'},
  after = {'nvim-cmp'},
  config = function()
    require('tabout').setup {
      tabkey = '<Tab>',
      backwards_tabkey = '<S-Tab>',
      act_as_tab = true,
      act_as_shift_tab = false,
      enable_backwards = true,
      completion = true,
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true,
      exclude = {}
    }
  end,
}
