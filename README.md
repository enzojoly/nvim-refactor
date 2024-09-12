# nvim-refactor

Messy init .vim -> init.lua time !

## Directory Structure

````
nvim-refactor
├── lazy-lock.json
└── lua
    ├── lsp
    │   ├── handler.lua
    │   ├── servers
    │   │   ├── asm_lsp.lua
    │   │   ├── bashls.lua
    │   │   ├── clangd.lua
    │   │   ├── clojure_lsp.lua
    │   │   ├── cmake.lua
    │   │   ├── cssls.lua
    │   │   ├── cssmodules_ls.lua
    │   │   ├── docker_compose_language_service.lua
    │   │   ├── dockerls.lua
    │   │   ├── elixirls.lua
    │   │   ├── erlangls.lua
    │   │   ├── fortls.lua
    │   │   ├── gopls.lua
    │   │   ├── graphql.lua
    │   │   ├── hls.lua
    │   │   ├── html.lua
    │   │   ├── intelephense.lua
    │   │   ├── jdtls.lua
    │   │   ├── jedi_language_server.lua
    │   │   ├── jsonls.lua
    │   │   ├── kotlin_language_server.lua
    │   │   ├── lemminx.lua
    │   │   ├── lua_ls.lua
    │   │   ├── metals.lua
    │   │   ├── neocmake.lua
    │   │   ├── ocamllsp.lua
    │   │   ├── phpactor.lua
    │   │   ├── powershell_es.lua
    │   │   ├── psalm.lua
    │   │   ├── pylsp.lua
    │   │   ├── pyright.lua
    │   │   ├── remark_ls.lua
    │   │   ├── rnix.lua
    │   │   ├── rust_analyzer.lua
    │   │   ├── solang.lua
    │   │   ├── solidity_ls.lua
    │   │   ├── spectral.lua
    │   │   ├── sqlls.lua
    │   │   ├── sqls.lua
    │   │   ├── svelte.lua
    │   │   ├── taplo.lua
    │   │   ├── texlab.lua
    │   │   ├── tsserver.lua
    │   │   ├── vimls.lua
    │   │   ├── yamlls.lua
    │   │   └── zls.lua
    │   └── servers_deprecated
    ├── plugins
    │   ├── init.lua
    │   ├── avante.lua
    │   ├── copilot.lua
    │   ├── dependency
    │   │   ├── init.lua
    │   │   ├── dressing.lua
    │   │   ├── img-clip.lua
    │   │   ├── mini-icons.lua
    │   │   ├── nui.lua
    │   │   ├── plenary.lua
    │   │   └── render-markdown.lua
    │   ├── git
    │   │   ├── init.lua
    │   │   ├── gitsigns.lua
    │   │   ├── lazygit.lua
    │   │   └── vimagit.lua
    │   ├── lsp
    │   │   ├── init.lua
    │   │   ├── lsp_lines.lua
    │   │   ├── lsp_signature.lua
    │   │   ├── lspconfig.lua
    │   │   ├── mason.lua
    │   │   └── treesitter.lua
    │   ├── notifs
    │   │   ├── init.lua
    │   │   ├── fidget.lua
    │   │   ├── noice.lua
    │   │   └── which-key.lua
    │   ├── telescope.lua
    │   ├── themes
    │   │   ├── everforest.lua
    │   │   └── lackluster.lua
    │   ├── ux
    │   │   ├── init.lua
    │   │   ├── lualine.lua
    │   │   ├── nerdtree.lua
    │   │   ├── undotree.lua
    │   │   ├── vimtex.lua
    │   │   ├── winshift.lua
    │   │   └── yazi.lua
    │   └── vim
    │       ├── init.lua
    │       ├── vim-commentary.lua
    │       ├── vim-surround.lua
    │       └── vimwiki.lua
    └── rc-ttnjja
        ├── init.lua
        ├── autocmd.lua
        ├── lazy.lua
        ├── remap.lua
        └── settings.lua

15 directories, 94 files ```
````
