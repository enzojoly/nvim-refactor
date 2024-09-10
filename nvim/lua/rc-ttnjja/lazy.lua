-- rc-ttnjja/lazy.lua
-- Plugin management using lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "sainnhe/everforest" },
  --{ "slugbyte/lackluster.nvim" },
  { "tpope/vim-surround" },
  { "preservim/nerdtree" },
  { "junegunn/goyo.vim" },
  { "vimwiki/vimwiki" },
  --{ "mfussenegger/nvim-lint" },
  --{ "mhartington/formatter.nvim" },
  { "tpope/vim-commentary" },
  { "mbbill/undotree" },
  { "NvChad/nvim-colorizer.lua" },
  { "abecodes/tabout.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  --{ "echasnovski/mini.nvim" },
  { "lervag/vimtex" },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "jreybert/vimagit" },
  { "lewis6991/gitsigns.nvim" },
  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "j-hui/fidget.nvim", opts = {} },
  { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "folke/which-key.nvim", opts = {} },
  { "sindrets/winshift.nvim" },
  { "yazi-rs/yazi" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "neovim/nvim-lspconfig" },
  { "ray-x/lsp_signature.nvim" },
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  --{ "hrsh7th/nvim-cmp" },
  --{ "hrsh7th/cmp-nvim-lsp" },
  --{ "L3MON4D3/LuaSnip" },
  --{ "saadparwaiz1/cmp_luasnip" },
  { "github/copilot.lua" },
  { "nvim-lua/plenary.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "stevearc/dressing.nvim" },
  { 'echasnovski/mini.icons' },
  { "HakonHarnes/img-clip.nvim" },
  { "yetone/avante.nvim", branch = "main", build = function() require("avante").build() end },
}, {
  install = {
    colorscheme = { "everforest" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
