-- ftplugin/markdown.lua
-- Clean markdown editing - no auto-formatting that breaks structure

-- Display: see what you're editing
vim.opt_local.conceallevel = 0
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

-- Indentation
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

-- CRITICAL: Disable auto-formatting that causes collapsing
vim.opt_local.formatoptions = "tqln"
--  t = auto-wrap text using textwidth
--  q = allow formatting comments with gq
--  l = don't break long lines in insert mode
--  n = recognize numbered lists

-- Spell check (toggle with <F5> from your remap.lua)
vim.opt_local.spell = false
vim.opt_local.spelllang = "en_gb"

-- Syntax highlighting in fenced code blocks
vim.g.markdown_fenced_languages = {
    "bash=sh", "sh", "zsh",
    "python", "lua", "c", "cpp",
    "javascript", "typescript",
    "html", "css", "json", "yaml",
    "sql", "nix"
}

-- Keymaps
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "<leader>p", "<cmd>PasteImage<CR>", opts)
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
