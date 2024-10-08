-- plugins/notifs/fidget.lua
-- Configuration for fidget plugin

return {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
        text = {
            spinner = "dots", -- animation shown when tasks are ongoing
            done = "⚑", -- character shown when all tasks are complete
            commenced = "Started", -- message shown when task starts
            completed = "Completed", -- message shown when task completes
        },
        align = {
            bottom = true, -- align fidgets along bottom edge of buffer
            right = true,  -- align fidgets along right edge of buffer
        },
        timer = {
            spinner_rate = 100,  -- frame rate of spinner animation, in ms
            fidget_decay = 2000, -- how long to keep around empty fidget, in ms
            task_decay = 1000,   -- how long to keep around completed task, in ms
        },
        window = {
            relative = "win", -- where to anchor, either "win" or "editor"
            blend = 0,        -- &winblend for the window
            zindex = nil,     -- the zindex value for the window
            border = "none",  -- style of border for the fidget window
        },
        fmt = {
            leftpad = true,       -- right-justify text in fidget box
            stack_upwards = true, -- list of tasks grows upwards
            max_width = 0,        -- maximum width of the fidget box
            fidget =              -- function to format fidget title
                function(fidget_name, spinner)
                    return string.format("%s %s", spinner, fidget_name)
                end,
            task = -- function to format each task line
                function(task_name, message, percentage)
                    return string.format(
                        "%s%s [%s]",
                        message,
                        percentage and string.format(" (%s%%)", percentage) or "",
                        task_name
                    )
                end,
        },
    },
    config = function(_, opts)
        require("fidget").setup(opts)
        vim.cmd([[
            highlight! FidgetTitle guifg=#32c6a6 guibg=NONE
            highlight! FidgetTask guifg=#32c6a6 guibg=NONE
            highlight! FidgetNormal guibg=NONE
        ]])
    end,
}
