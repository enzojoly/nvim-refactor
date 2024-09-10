-- plugins/init.lua
-- Entry point for all plugin configurations

return {
  -- This file is automatically loaded by lazy.nvim
  -- It will load all the plugin configurations in this directory
  -- except for the 'notifs' subdirectory, which we'll load separately

  require("plugins.vim-surround"),
  require("plugins.nerdtree"),
  require("plugins.goyo"),
  require("plugins.vimwiki"),
  require("plugins.vim-commentary"),
  require("plugins.undotree"),
  require("plugins.nvim-colorizer"),
  require("plugins.tabout"),
  require("plugins.vimtex"),
  require("plugins.render-markdown"),
  require("plugins.vimagit"),
  require("plugins.gitsigns"),
  require("plugins.lazygit"),
  require("plugins.lualine"),
  require("plugins.telescope"),
  require("plugins.which-key"),
  require("plugins.winshift"),
  require("plugins.yazi"),
  require("plugins.treesitter"),
  require("plugins.lspconfig"),
  require("plugins.lsp_signature"),
  require("plugins.lsp_lines"),
  require("plugins.mason"),
  require("plugins.copilot"),
  require("plugins.plenary"),
  require("plugins.nui"),
  require("plugins.dressing"),
  require("plugins.mini-icons"),
  require("plugins.img-clip"),
  require("plugins.avante"),

  -- Load the notifs subdirectory
  { import = "plugins.notifs" },
}
