vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("rc-ttnjja")
require("lsp.handler").setup()

vim.cmd.colorscheme("everforest")
vim.opt.background = "dark"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "Normalfloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normalnc", { fg = "#32c6a6", bg = "none" })
vim.api.nvim_set_hl(0, "Signcolumn", { bg = "none" })
