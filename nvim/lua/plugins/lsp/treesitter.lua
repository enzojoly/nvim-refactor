-- plugins/treesitter.lua
-- Minimal working treesitter config

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    if vim.bo.filetype ~= "tex" and vim.bo.filetype ~= "latex" then
                        pcall(vim.treesitter.start)
                    end
                end,
            })
        end
    },
    {
        "neo4j-contrib/cypher-vim-syntax",
        ft = { "cypher", "cql" }
    }
}
