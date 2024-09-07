# nvim-refactor
Messy init \.vim -> init.lua time !

nvim/
├── init.lua
└── lua/
    ├── core/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    ├── plugins/
    │   ├── init.lua
    │   └── configs/
    │       ├── telescope.lua
    │       ├── treesitter.lua
    │       └── ...
    └── lsp/
        ├── init.lua
        └── servers/
            ├── pyright.lua
            ├── tsserver.lua
            └── ...
