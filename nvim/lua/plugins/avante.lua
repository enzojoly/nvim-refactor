-- plugins/avante.lua
-- Configuration for avante plugin

return {
    "yetone/avante.nvim",
    lazy = false,
    priority = 100, -- Set a high priority to ensure it loads early
    build = "make",
    opts = {
        provider = "claude",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            temperature = 0,
            max_tokens = 4096,
            api_key = ANTHROPIC_KEY,
        },
        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
        },
        windows = {
            position = "right",
            wrap = true,
            width = 30,
            sidebar_header = {
                align = "center",
                rounded = true,
            },
        },
    },
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    use_absolute_path = true,
                },
            },
        },
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    config = function(_, opts)
        local setup_success, setup_error = pcall(function()
            require("avante").setup(opts)
        end)

        if not setup_success then
            error("Failed to set up Avante: " .. tostring(setup_error))
        end

        -- Load avante_lib after your colorscheme is set
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                local load_success, load_error = pcall(function()
                    require('avante_lib').load()
                end)

                if not load_success then
                    error("Failed to load avante_lib: " .. tostring(load_error))
                end
            end,
        })
    end,
}
