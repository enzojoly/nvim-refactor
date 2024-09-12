-- lsp/handler.lua
-- This file handles the general LSP setup and provides common functions for all language servers

local M = {} -- Module table

-- Define diagnostic signs for LSP
function M.define_sign()
    local signs = {
        { name = "DiagnosticSignError", text = "✘", texthl = "DiagnosticSignError" },
        { name = "DiagnosticSignWarn", text = "▲", texthl = "DiagnosticSignWarn" },
        { name = "DiagnosticSignHint", text = "⚑", texthl = "DiagnosticSignHint" },
        { name = "DiagnosticSignInfo", text = "ℹ", texthl = "DiagnosticSignInfo" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.texthl, text = sign.text, numhl = "" })
    end
end

-- Define highlight groups for LSP references
function M.def_reference_highlight()
    -- Highlight for text references
    vim.cmd("highlight LspReferenceText guibg=#bcbcbc")
    -- Highlight for read references
    vim.cmd("highlight LspReferenceRead guibg=#d9ead3")
    -- Highlight for write references, with underline
    vim.cmd("highlight LspReferenceWrite guibg=#cfe2f3 gui=underline")
end

-- Set up keybindings for LSP functionality
---@param bufnr number Buffer number to attach the keybindings to
function M.keymap(bufnr)
    -- Function to open diagnostic float window
    local function open_diagnostic()
        vim.diagnostic.open_float(nil, { focusable = true })
    end

    -- Get the increname function from the inc_rename plugin
    --local increname = require("inc_rename").increname

    -- Set up various LSP-related keybindings
    -- Uncomment and modify these as needed
    --vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
    --vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
    --vim.keymap.set("n", "<Leader><C-k>", vim.lsp.buf.signature_help, { desc = "Signature", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>ls", vim.lsp.buf.signature_help, { desc = "Signature", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>l.", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.definition, { desc = "Definitions", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>lD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>li", vim.lsp.buf.implementation, { desc = "Implementation", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>lw", open_diagnostic, { desc = "Diagnostic", buffer = bufnr })
    --vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "Format", buffer = bufnr })
    --vim.keymap.set("n", "<F2>", increname, { desc = "Rename", buffer = bufnr })
end

-- Set up automatic highlighting of the symbol under the cursor
---@param bufnr number Buffer number to attach the auto-highlight to
function M.auto_highlight_document(bufnr)
    -- Create an autocommand group for document highlighting
    local g = vim.api.nvim_create_augroup("document_highlight", { clear = false })

    -- Autocommand to highlight symbol under cursor when holding the cursor still
    --vim.api.nvim_create_autocmd("CursorHold", {
    --    callback = vim.lsp.buf.document_highlight,
    --    group = g,
    --    buffer = bufnr,
    --    desc = "Highlights symbol under cursor",
    --})

    -- Autocommand to clear highlights when moving the cursor
    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        group = g,
        buffer = bufnr,
        desc = "Removes document highlights from current buffer.",
    })

    -- Notify that document highlight has been set up (for debugging)
    vim.notify(
        "lsp document highlight set to buffer: " .. bufnr .. ": " .. vim.api.nvim_buf_get_name(bufnr),
        vim.log.levels.TRACE
    )
end

-- Set up automatic formatting on save
---@param client table LSP client
---@param bufnr number Buffer number to attach the formatting to
function M.on_attach_format(client, bufnr)
    -- Create an autocommand to format the buffer before writing
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = false }),
        callback = function()
            vim.lsp.buf.format({
                bufnr = bufnr,
            })
        end,
        desc = "Format buffer just before write",
        buffer = bufnr,
    })

    -- Notify that formatting has been set up (for debugging)
    --vim.notify(
    --    "lsp formater " .. client.name .. " set to buffer " .. bufnr .. ": " .. vim.api.nvim_buf_get_name(bufnr),
    --    vim.log.levels.TRACE
    --)
end

-- Set up LSP capabilities
---@return table capabilities
function M.capabilities()
    -- Get the default client capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Uncomment the following line if you decide to use nvim-cmp in the future
    -- return require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- For now, just return the default capabilities
    return capabilities
end

-- Main setup function for LSP
function M.setup()
    -- Define diagnostic signs
    --M.define_sign()
    -- Set up reference highlighting
    M.def_reference_highlight()

    -- Common on_attach function for all LSP servers
    local on_attach = function(client, bufnr)
        -- Set up keymaps
        M.keymap(bufnr)
        -- Set up document highlighting
        M.auto_highlight_document(bufnr)

        -- Set up formatting if the client supports it
        if client.supports_method("textDocument/formatting") then
            M.on_attach_format(client, bufnr)
        end
    end

    -- Get the capabilities
    local capabilities = M.capabilities()

    -- Define a table mapping filetypes to their respective language servers
    local filetype_to_lsp = {
        asm = { "asm_lsp" },
        bash = { "bashls" },
        c = { "clangd" },
        cpp = { "clangd" },
        clojure = { "clojure_lsp" },
        cmake = { "cmake", "neocmake" },
        css = { "cssls", "cssmodules_ls" },
        dockerfile = { "dockerls" },
        elixir = { "elixirls" },
        fortran = { "fortls" },
        go = { "gopls" },
        graphql = { "graphql" },
        html = { "html" },
        java = { "jdtls" },
        javascript = { "tsserver" },
        ["javascript.jsx"] = { "tsserver" },
        json = { "jsonls" },
        kotlin = { "kotlin_language_server" },
        lua = { "lua_ls" },
        markdown = { "remark_ls" },
        nix = { "rnix" },
        php = { "intelephense", "phpactor", "psalm" },
        powershell = { "powershell_es" },
        python = { "jedi_language_server", "pylsp", "pyright" },
        rust = { "rust_analyzer" },
        solidity = { "solang", "solidity_ls" },
        sql = { "sqlls", "sqls" },
        svelte = { "svelte" },
        tex = { "texlab" },
        toml = { "taplo" },
        typescript = { "tsserver" },
        ["typescript.tsx"] = { "tsserver" },
        vim = { "vimls" },
        yaml = { "yamlls" },
        zig = { "zls" },
    }

    -- Function to setup LSP for a buffer
    local function setup_lsp_for_buffer(bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        local servers = filetype_to_lsp[filetype]

        if servers then
            for _, server in ipairs(servers) do
                local ok, server_config = pcall(require, "lsp.servers." .. server)
                if ok then
                    server_config.setup(on_attach, capabilities)
                else
                    vim.notify("Failed to load LSP config for " .. server, vim.log.levels.ERROR)
                end
            end
        end
    end

    -- Set up an autocommand to run setup_lsp_for_buffer when a file is opened or when the filetype is set
    vim.api.nvim_create_autocmd({ "BufReadPost", "FileType" }, {
        group = vim.api.nvim_create_augroup("LspSetup", { clear = true }),
        callback = function(args)
            setup_lsp_for_buffer(args.buf)
        end,
    })
end

-- Return the module
return M
