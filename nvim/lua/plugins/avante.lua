-- plugins/avante.lua
-- Configuration for avante plugin

-- Complete configuration for avante.nvim
return {
    "yetone/avante.nvim",
    lazy = false,
    priority = 100,
    build = function()
        local plugin_dir = vim.fn.stdpath("data") .. "/lazy/avante.nvim"
        vim.notify("Building avante.nvim in " .. plugin_dir, vim.log.levels.INFO)
        local clean_result = vim.fn.system("cd " .. plugin_dir .. " && make clean")
        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to clean avante.nvim: " .. clean_result, vim.log.levels.ERROR)
            return
        end
        local build_result = vim.fn.system("cd " .. plugin_dir .. " && make")
        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to build avante.nvim: " .. build_result, vim.log.levels.ERROR)
        else
            vim.notify("Successfully built avante.nvim", vim.log.levels.INFO)
        end
    end,
    opts = {
        provider = "claude",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            temperature = 0,
            max_tokens = 4096,
            api_key = vim.env.ANTHROPIC_KEY,
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
        keymaps = {
            -- Add any custom keymaps here
            -- Example: ["<leader>a"] = "Avante",
        },
        ui = {
            code_block_highlight = "default",
            markdown_highlight = "default",
        },
        features = {
            -- Enable or disable specific features
            code_actions = true,
            code_lens = true,
            diagnostics = true,
            inlay_hints = true,
        },
        prompts = {
            my_custom_prompt = "You are a professional software developer.",
        },
    },
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --mini-icons
        "echasnovski/mini.nvim",
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
    },
    config = function(_, opts)
        vim.schedule(function()
            local setup_success, setup_error = pcall(function()
                require("avante").setup(opts)
            end)
            if not setup_success then
                vim.notify("Failed to set up Avante: " .. tostring(setup_error), vim.log.levels.ERROR)
            else
                --                vim.notify("Avante setup successful", vim.log.levels.INFO)
            end

            -- Additional setup steps
            if setup_success then
                -- Set up any additional configurations or integrations here
                -- Example: require("avante").setup_lsp_integration()
            end
        end)

        -- Load avante_lib after your colorscheme is set
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.schedule(function()
                    local load_success, load_error = pcall(function()
                        require('avante_lib').load()
                    end)
                    if not load_success then
                        vim.notify("Failed to load avante_lib: " .. tostring(load_error), vim.log.levels.ERROR)
                    else
                        --                       vim.notify("avante_lib loaded successfully", vim.log.levels.INFO)
                    end
                end)
            end,
        })

        -- Set up any custom commands
        vim.api.nvim_create_user_command("AvanteReload", function()
            require("avante").reload()
            vim.notify("Avante reloaded", vim.log.levels.INFO)
        end, {})

        -- Set up any custom autocommands
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "Avante",
            callback = function()
                -- Set any buffer-local options or mappings for Avante buffers
                vim.opt_local.wrap = true
                vim.opt_local.linebreak = true
            end,
        })
    end,
}
