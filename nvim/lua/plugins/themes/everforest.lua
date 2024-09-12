-- /plugins/themes/everforest.lua
-- Configuration for Everforest color scheme

-- lua/plugins/themes/everforest.lua
return {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
        -- Set up Everforest theme
        vim.g.everforest_background = 'hard'
        vim.g.everforest_better_performance = 1
    end,
}
