-- plugins/init.lua
-- Entry point for all plugin configurations

return {
    -- This file is automatically loaded by lazy.nvim
    -- It will load all the plugin configurations in this directory
    -- except for subdirectories load separately

    require("plugins.avante"),
    require("plugins.copilot"),
    require("plugins.telescope"),

    -- Load subdirectory
    { import = "plugins.dependency" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.notifs" },
    { import = "plugins.themes" },
    { import = "plugins.ux" },
    { import = "plugins.vim" },

}
