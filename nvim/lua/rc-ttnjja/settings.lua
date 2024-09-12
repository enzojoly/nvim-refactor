-- rc-ttnjja/settings.lua
-- General settings for Neovim
-- Basic settings
vim.opt.title = true
vim.opt.bg = "light"
-- vim.opt.go = "a"  -- This line is removed as it's not supported in Neovim
-- Disable mouse
-- vim.opt.mouse = "a"  -- Commented out as it's disabled in init.vim
-- Clipboard settings
vim.opt.clipboard = "unnamedplus"
-- Status line settings
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false
-- Set up Python and latexmk paths
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.vimtex_compiler_progname = '/usr/bin/latexmk'
-- Basic settings
vim.opt.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable autocompletion
vim.opt.wildmode = "longest,list,full"
-- Split settings
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Adjust C-style indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.cinoptions = "(,W1,g1,i1,t0,+1,c1"
vim.opt.smartindent = true
vim.opt.scrolloff = 6
vim.opt.updatetime = 50
vim.opt.termguicolors = true
-- Set the color for spell check underlines (red)
vim.cmd([[
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red guisp=red
]])
vim.opt.spell = false

-- Disable health checks for Python, Node.js, and Ruby providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable health checks for which-key
vim.g.loaded_health__which_key = 1

--vim.opt.hlsearch = false
--vim.opt.cursorline = true
--vim.opt.completeopt = { "menuone", "noselect" }
--vim.opt.completeopt = { "menuone", "noselect" }
