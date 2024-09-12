-- ftplugin/tex.lua
-- Specific settings for LaTeX files

-- Enable spell checking
vim.opt_local.spell = false
vim.opt_local.spelllang = "en_gb"

-- Set textwidth to 80 characters
vim.opt_local.textwidth = 80

-- Enable soft wrapping
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Use spaces instead of tabs
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

-- Set indentation settings
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

-- Enable concealment
vim.opt_local.conceallevel = 2

-- Set foldmethod to syntax
vim.opt_local.foldmethod = "syntax"

-- VimTeX specific settings
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0

-- LaTeX cleanup function
local function cleanup_tex_files()
    local texfile = vim.fn.expand('%:t:r')
    local extensions_to_delete = {'aux', 'log', 'out', 'toc', 'lof', 'lot', 'bbl', 'blg', 'fls', 'fdb_latexmk', 'synctex.gz'}

    for _, ext in ipairs(extensions_to_delete) do
        local file = texfile .. '.' .. ext
        if vim.fn.filereadable(file) == 1 then
            vim.fn.delete(file)
        end
    end
end

-- Set up autocommands for LaTeX cleanup
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    callback = cleanup_tex_files
})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*.tex",
    callback = cleanup_tex_files
})

-- Run texclear script on leaving .tex files
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*.tex",
    command = "!texclear %"
})

-- Key mappings for LaTeX
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>le', ':VimtexErrors<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lc', ':VimtexClean<CR>', { noremap = true, silent = true })
