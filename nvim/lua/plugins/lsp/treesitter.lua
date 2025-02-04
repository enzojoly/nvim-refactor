-- plugins/treesitter.lua
-- Configuration for treesitter plugin

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "asm", "bash", "c", "clojure", "cmake", "css", "dockerfile", "elixir", "fortran",
                    "go", "graphql", "haskell", "html", "java", "javascript", "json", "kotlin",
                    "latex", "lua", "markdown", "nix", "ocaml", "php", "python", "rust", "regex",
                    "scala", "solidity", "sql", "svelte", "toml", "typescript", "vim", "yaml", "zig"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    }
}
