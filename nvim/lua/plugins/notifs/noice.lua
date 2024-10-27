-- plugins/notifs/noice.lua
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            progress = {
                enabled = false, -- Disable LSP progress in Noice
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            hover = {
                enabled = true,
            },
            signature = {
                enabled = false, -- Keep this disabled to avoid conflicts
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
            -- Skip janky copilot notif
            {
                filter = {
                    event = "msg_show",
                    find =
                    "^RPC%[Error%] code_name = ServerNotInitialized, message = \"Agent service not initialized%.\"$"
                },
                opts = { skip = true },
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
    },
}
