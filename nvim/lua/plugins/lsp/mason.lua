-- plugins/lsp/mason.lua
-- Complete Mason configuration for NixOS with all dependencies

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
            -- All servers - dependencies now available via NixOS
            ensure_installed = {
                -- Core System
                "asm_lsp",
                "bashls",

                -- C/C++
                "clangd",

                -- C#
                "omnisharp",

                -- Clojure
                "clojure_lsp",

                -- CMake
                "neocmake",

                -- CSS
                "cssls",
                "cssmodules_ls",

                -- Docker
                "dockerls",
                "docker_compose_language_service",

                -- Elixir
                "elixirls",

                -- Erlang
                "erlangls",

                -- F#
                "fsautocomplete",

                -- Fortran
                "fortls",

                -- Go
                "gopls",
                "golangci_lint_ls",

                -- GraphQL
                "graphql",

                -- HTML
                "html",

                -- Java
                "jdtls",

                -- JavaScript/TypeScript
                "ts_ls",
                "denols",
                "eslint",

                -- JSON
                "jsonls",

                -- Kotlin
                "kotlin_language_server",

                -- Lua
                "lua_ls",

                -- Markdown
                "marksman",
                "remark_ls",

                -- Nix
                "nil_ls",

                -- PHP
                "intelephense",
                "phpactor",
                "psalm",

                -- PowerShell
                "powershell_es",

                -- Python
                "pyright",
                "pylsp",
                "jedi_language_server",

                -- R
                "r_language_server",

                -- Ruby
                "solargraph",

                -- Rust
                "rust_analyzer",

                -- Scala

                -- Solidity
                "solidity_ls",

                -- SQL
                "sqlls",
                "sqls",

                -- Svelte
                "svelte",

                -- TOML
                "taplo",

                -- LaTeX
                "texlab",

                -- Terraform
                "terraformls",

                -- Vim
                "vimls",

                -- Vue
                "vuels",

                -- XML
                "lemminx",

                -- YAML
                "yamlls",
                "ansiblels",

                -- Zig
                "zls",

                -- Additional
                "angularls",
                "astro",
                "crystalline",
                "prismals",
                "julials",
            },

            automatic_installation = true,
        })
    end
}
