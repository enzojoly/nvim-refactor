-- plugins/treesitter.lua
-- Configuration for treesitter plugin

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.cypher = {
                install_info = {
                    url = "https://github.com/pupli/tree-sitter-cypher",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = { "cypher", "cql" },
            }

            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "asm", "bash", "c", "clojure", "cmake", "css", "cypher", "dockerfile", "elixir",
                    "fortran", "go", "graphql", "haskell", "html", "java", "javascript", "json", "kotlin",
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
    },
    {
        "neo4j-contrib/cypher-vim-syntax",
        ft = { "cypher", "cql" }
    }
}
