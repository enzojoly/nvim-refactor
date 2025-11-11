# nvim-refactor

Messy init .vim -> init.lua time !

## Directory Structure

```

nvim-refactor
├── dot-vim-backup
│   └── init.vim
├── nvim
│   ├── ftplugin
│   │   ├── markdown.lua
│   │   └── tex.lua
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       ├── lsp
│       │   └── handler.lua
│       ├── plugins
│       │   ├── dependency
│       │   │   ├── dressing.lua
│       │   │   ├── img-clip.lua
│       │   │   ├── init.lua
│       │   │   ├── mini-icons.lua
│       │   │   ├── nui.lua
│       │   │   └── plenary.lua
│       │   ├── git
│       │   │   ├── gitsigns.lua
│       │   │   ├── init.lua
│       │   │   ├── lazygit.lua
│       │   │   └── vimagit.lua
│       │   ├── init.lua
│       │   ├── lsp
│       │   │   ├── init.lua
│       │   │   ├── lspconfig.lua
│       │   │   ├── lsp_lines.lua
│       │   │   ├── lsp_signature.lua
│       │   │   ├── mason.lua
│       │   │   └── treesitter.lua
│       │   ├── notifs
│       │   │   ├── fidget.lua
│       │   │   ├── init.lua
│       │   │   ├── noice.lua
│       │   │   └── which-key.lua
│       │   ├── telescope.lua
│       │   ├── themes
│       │   │   ├── everforest.lua
│       │   │   └── lackluster.lua
│       │   ├── ux
│       │   │   ├── init.lua
│       │   │   ├── lualine.lua
│       │   │   ├── nerdtree.lua
│       │   │   ├── undotree.lua
│       │   │   ├── vimtex.lua
│       │   │   ├── winshift.lua
│       │   │   └── yazi.lua
│       │   └── vim
│       │       ├── init.lua
│       │       ├── vim-commentary.lua
│       │       ├── vim-surround.lua
│       │       └── vimwiki.lua
│       └── rc-ttnjja
│           ├── autocmd.lua
│           ├── init.lua
│           ├── lazy.lua
│           ├── remap.lua
│           └── settings.lua
├── README.md
└── todo.md

15 directories, 48 files

```
