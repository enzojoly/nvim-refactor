-- plugins/lsp/mason.lua
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "asm_lsp", "bashls", "clangd", "clojure_lsp", "cmake", "cssls", "cssmodules_ls",
                "docker_compose_language_service", "dockerls", "elixirls", "fortls",
                "gopls", "graphql", "html", "intelephense", "jdtls", "jedi_language_server",
                "jsonls", "kotlin_language_server", "lemminx", "lua_ls", "neocmake",
                "phpactor", "powershell_es", "psalm", "pylsp", "pyright", "remark_ls",
                "rnix", "rust_analyzer", "solang", "solidity_ls", "spectral", "sqlls", "sqls",
                "svelte", "taplo", "texlab", "vimls", "yamlls", "zls"
            },
        }, {
            automatic_installation = true,
        })
    end
}
