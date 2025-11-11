-- lsp/handler.lua
-- Complete LSP configuration for Neovim 0.11+ with all servers

local M = {}

function M.def_reference_highlight()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            update_in_insert = true,
        }
    )
end

function M.keymap(bufnr)
    -- Add custom keybindings here
end

function M.on_attach_format(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = false }),
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
        desc = "Format buffer just before write",
        buffer = bufnr,
    })
end

function M.capabilities()
    return vim.lsp.protocol.make_client_capabilities()
end

function M.setup()
    M.def_reference_highlight()

    local on_attach = function(client, bufnr)
        M.keymap(bufnr)
        if client.supports_method("textDocument/formatting") then
            M.on_attach_format(client, bufnr)
        end
    end

    local capabilities = M.capabilities()

    -- Helper function
    local function make_root_dir(markers)
        return function(fname)
            return vim.fs.root(fname, markers) or vim.fn.getcwd()
        end
    end

    -- All server configurations
    local servers = {
        -- Assembly
        asm_lsp = {
            filetypes = {"asm", "s", "S"},
            root_dir = make_root_dir({".git"}),
        },

        -- Bash
        bashls = {
            cmd = { "bash-language-server", "start" },
            filetypes = { "sh", "bash" },
            root_dir = make_root_dir({".git"}),
            settings = {
                bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.command)"
                }
            }
        },

        -- C/C++
        clangd = {
            cmd = { "clangd", "--background-index" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            root_dir = make_root_dir({
                '.clangd', '.clang-tidy', '.clang-format',
                'compile_commands.json', '.git'
            }),
        },

        -- C#
        omnisharp = {
            filetypes = {"cs"},
            root_dir = make_root_dir({"*.sln", "*.csproj", ".git"}),
        },

        -- Clojure
        clojure_lsp = {
            filetypes = {"clojure", "edn"},
            root_dir = make_root_dir({"project.clj", "deps.edn", ".git"}),
        },

        -- CMake
        neocmake = {
            filetypes = {"cmake"},
            root_dir = make_root_dir({"CMakeLists.txt", ".git"}),
        },

        -- CSS
        cssls = {
            filetypes = { "css", "scss", "less" },
            root_dir = make_root_dir({"package.json", ".git"}),
            settings = {
                css = { validate = true },
                less = { validate = true },
                scss = { validate = true }
            }
        },

        cssmodules_ls = {
            filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- Dart
        dartls = {
            root_dir = make_root_dir({"pubspec.yaml", ".git"}),
        },

        -- Docker
        dockerls = {
            filetypes = { "dockerfile" },
            root_dir = make_root_dir({"Dockerfile", ".git"}),
        },

        docker_compose_language_service = {
            filetypes = { "yaml.docker-compose" },
            root_dir = make_root_dir({"docker-compose.yml", "docker-compose.yaml"}),
        },

        -- Elixir
        elixirls = {
            cmd = { "elixir-ls" },
            filetypes = {"elixir", "eelixir", "heex"},
            root_dir = make_root_dir({"mix.exs", ".git"}),
        },

        -- Erlang
        erlangls = {
            root_dir = make_root_dir({"rebar.config", ".git"}),
        },

        -- ESLint
        eslint = {
            filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
            root_dir = make_root_dir({".eslintrc", "package.json", ".git"}),
        },

        -- F#
        fsautocomplete = {
            filetypes = {"fsharp"},
            root_dir = make_root_dir({"*.fsproj", ".git"}),
        },

        -- Fortran
        fortls = {
            filetypes = {"fortran"},
            root_dir = make_root_dir({".git"}),
        },

        -- Go
        gopls = {
            filetypes = {"go", "gomod"},
            root_dir = make_root_dir({"go.mod", ".git"}),
            settings = {
                gopls = {
                    analyses = { unusedparams = true },
                    staticcheck = true,
                },
            },
        },

        golangci_lint_ls = {
            filetypes = {'go', 'gomod'},
            root_dir = make_root_dir({'.golangci.yml', 'go.mod', '.git'}),
        },

        -- GraphQL
        graphql = {
            filetypes = { "graphql", "gql" },
            root_dir = make_root_dir({'.graphqlrc', '.git'}),
        },

        -- Haskell
        hls = {
            filetypes = { "haskell", "lhaskell" },
            root_dir = make_root_dir({"*.cabal", "stack.yaml", ".git"}),
        },

        -- HTML
        html = {
            filetypes = { "html", "htmldjango" },
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- Java
        jdtls = {
            filetypes = {"java"},
            root_dir = make_root_dir({"pom.xml", "build.gradle", ".git"}),
        },

        -- JavaScript/TypeScript
        ts_ls = {
            filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
            root_dir = make_root_dir({"package.json", "tsconfig.json", ".git"}),
        },

        denols = {
            filetypes = {"javascript", "typescript"},
            root_dir = make_root_dir({"deno.json", "deno.jsonc"}),
        },

        -- JSON
        jsonls = {
            filetypes = {"json", "jsonc"},
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- Julia
        julials = {
            filetypes = {"julia"},
            root_dir = make_root_dir({".git"}),
        },

        -- Kotlin
        kotlin_language_server = {
            root_dir = make_root_dir({"build.gradle", ".git"}),
        },

        -- Lua
        lua_ls = {
            filetypes = {"lua"},
            root_dir = make_root_dir({".git"}),
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = {'vim'} },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        },

        -- Markdown
        marksman = {
            filetypes = {"markdown"},
            root_dir = make_root_dir({".git"}),
        },

        remark_ls = {
            filetypes = {"markdown"},
            root_dir = make_root_dir({".git"}),
        },

        -- Nix
        nil_ls = {
            filetypes = {"nix"},
            root_dir = make_root_dir({"flake.nix", ".git"}),
        },

        -- OCaml
        ocamllsp = {
            root_dir = make_root_dir({"*.opam", ".git"}),
        },

        -- PHP
        intelephense = {
            filetypes = {"php"},
            root_dir = make_root_dir({"composer.json", ".git"}),
        },

        phpactor = {
            filetypes = {"php"},
            root_dir = make_root_dir({"composer.json", ".git"}),
        },

        psalm = {
            filetypes = {"php"},
            root_dir = make_root_dir({"psalm.xml", ".git"}),
        },

        -- PowerShell
        powershell_es = {
            filetypes = {"ps1", "psm1", "psd1"},
        },

        -- Prisma
        prismals = {
            filetypes = {"prisma"},
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- Python
        pyright = {
            filetypes = {"python"},
            root_dir = make_root_dir({"pyproject.toml", "setup.py", ".git"}),
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        typeCheckingMode = "basic",
                    },
                },
            },
        },

        pylsp = {
            filetypes = {"python"},
            root_dir = make_root_dir({"pyproject.toml", ".git"}),
        },

        jedi_language_server = {
            filetypes = {"python"},
            root_dir = make_root_dir({"pyproject.toml", ".git"}),
        },

        ruff = {
            filetypes = {"python"},
            root_dir = make_root_dir({"pyproject.toml", ".git"}),
        },

        -- R
        r_language_server = {
            filetypes = {"r", "rmd"},
            root_dir = make_root_dir({".git"}),
        },

        -- Ruby
        solargraph = {
            filetypes = {"ruby"},
            root_dir = make_root_dir({"Gemfile", ".git"}),
        },

        -- Rust
        rust_analyzer = {
            filetypes = {"rust"},
            root_dir = make_root_dir({"Cargo.toml", ".git"}),
            settings = {
                ['rust-analyzer'] = {
                    cargo = { loadOutDirsFromCheck = true },
                    procMacro = { enable = true },
                },
            }
        },

        -- Scala
        metals = {
            root_dir = make_root_dir({"build.sbt", ".git"}),
        },

        -- Solidity
        solidity_ls = {
            filetypes = {"solidity"},
            root_dir = make_root_dir({".git"}),
        },

        -- SQL
        sqlls = {
            filetypes = {"sql"},
            root_dir = make_root_dir({".git"}),
        },

        sqls = {
            filetypes = {"sql", "mysql"},
            root_dir = make_root_dir({".git"}),
        },

        -- Svelte
        svelte = {
            filetypes = { "svelte" },
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- TOML
        taplo = {
            filetypes = {"toml"},
            root_dir = make_root_dir({".git"}),
        },

        -- LaTeX
        texlab = {
            filetypes = {"tex", "plaintex", "bib"},
            root_dir = make_root_dir({".git"}),
            settings = {
                texlab = {
                    auxDirectory = ".",
                    build = {
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                        executable = "latexmk",
                        onSave = false
                    },
                }
            }
        },

        -- Terraform
        terraformls = {
            filetypes = {"terraform", "tf"},
            root_dir = make_root_dir({".terraform", ".git"}),
        },

        -- Vim
        vimls = {
            filetypes = {"vim"},
            root_dir = make_root_dir({".git"}),
        },

        -- Vue
        volar = {
            filetypes = {'vue'},
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        vuels = {
            filetypes = { "vue" },
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        -- XML
        lemminx = {
            filetypes = {"xml", "xsd", "svg"},
            root_dir = make_root_dir({".git"}),
        },

        -- YAML
        yamlls = {
            filetypes = {"yaml"},
            root_dir = make_root_dir({".git"}),
            settings = {
                yaml = {
                    schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    },
                    validate = true,
                },
            },
        },

        ansiblels = {
            filetypes = {"yaml.ansible"},
            root_dir = make_root_dir({".git"}),
        },

        -- Zig
        zls = {
            filetypes = {"zig"},
            root_dir = make_root_dir({"build.zig", ".git"}),
        },

        -- Additional
        angularls = {
            filetypes = {"typescript", "html"},
            root_dir = make_root_dir({"angular.json", ".git"}),
        },

        astro = {
            filetypes = {"astro"},
            root_dir = make_root_dir({"package.json", ".git"}),
        },

        crystalline = {
            filetypes = {"crystal"},
            root_dir = make_root_dir({"shard.yml", ".git"}),
        },
    }

    -- Register all configurations
    for name, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        vim.lsp.config(name, config)
    end

    -- Comprehensive filetype mapping
    local ft_to_servers = {
        asm = {"asm_lsp"}, s = {"asm_lsp"}, S = {"asm_lsp"},
        bash = {"bashls"}, sh = {"bashls"},
        c = {"clangd"}, cpp = {"clangd"}, objc = {"clangd"},
        cs = {"omnisharp"},
        clojure = {"clojure_lsp"}, edn = {"clojure_lsp"},
        cmake = {"neocmake"},
        crystal = {"crystalline"},
        css = {"cssls"}, scss = {"cssls"}, less = {"cssls"},
        dart = {"dartls"},
        dockerfile = {"dockerls"},
        ["yaml.docker-compose"] = {"docker_compose_language_service"},
        elixir = {"elixirls"}, eelixir = {"elixirls"},
        erlang = {"erlangls"},
        fsharp = {"fsautocomplete"},
        fortran = {"fortls"},
        go = {"gopls"}, gomod = {"gopls"},
        graphql = {"graphql"}, gql = {"graphql"},
        haskell = {"hls"}, lhaskell = {"hls"},
        html = {"html"}, htmldjango = {"html"},
        java = {"jdtls"},
        javascript = {"ts_ls", "eslint"},
        javascriptreact = {"ts_ls", "eslint", "cssmodules_ls"},
        typescript = {"ts_ls", "eslint"},
        typescriptreact = {"ts_ls", "eslint", "cssmodules_ls"},
        json = {"jsonls"}, jsonc = {"jsonls"},
        julia = {"julials"},
        kotlin = {"kotlin_language_server"},
        lua = {"lua_ls"},
        markdown = {"marksman"},
        nix = {"nil_ls"},
        ocaml = {"ocamllsp"},
        php = {"intelephense"},
        ps1 = {"powershell_es"},
        prisma = {"prismals"},
        python = {"pyright", "ruff"},
        r = {"r_language_server"}, rmd = {"r_language_server"},
        ruby = {"solargraph"},
        rust = {"rust_analyzer"},
        scala = {"metals"},
        solidity = {"solidity_ls"},
        sql = {"sqlls"}, mysql = {"sqls"},
        svelte = {"svelte"},
        tex = {"texlab"}, plaintex = {"texlab"}, bib = {"texlab"},
        terraform = {"terraformls"}, tf = {"terraformls"},
        toml = {"taplo"},
        vim = {"vimls"},
        vue = {"volar"},
        xml = {"lemminx"}, xsd = {"lemminx"},
        yaml = {"yamlls"},
        ["yaml.ansible"] = {"ansiblels"},
        zig = {"zls"},
        astro = {"astro"},
    }

    -- Enable LSP on FileType
    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
        callback = function(args)
            local servers = ft_to_servers[vim.bo[args.buf].filetype]
            if servers then
                for _, server in ipairs(servers) do
                    vim.lsp.enable(server)
                end
            end
        end,
    })
end

return M
