-- markdown.lua

-- Set local options for markdown files
vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_gb"
vim.opt_local.conceallevel = 2
vim.opt_local.textwidth = 180
vim.opt_local.formatoptions:append('a')
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

-- Enable fenced code block syntax highlighting
vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'lua' }

-- Keymappings specific to markdown files
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>p', ':InsertImage<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>t', ':TableFormat<CR>', { noremap = true, silent = true })

-- Enable Goyo by default for mutt writing
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "/tmp/neomutt*",
    callback = function()
        vim.cmd([[
            let g:goyo_width=80
            :Goyo
            set bg=light
        ]])
    end,
})

-- Set filetype for calcurse notes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "/tmp/calcurse*", "~/.calcurse/notes/*" },
    command = [[set filetype=markdown]],
})

-- Remove trailing whitespace and newlines on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.md",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\n\+\%$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Dash-dash-space signature delimiter in emails (assuming markdown for emails)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*neomutt*",
    command = [[%s/^--$/-- /e]],
})
