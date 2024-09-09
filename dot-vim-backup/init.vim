let mapleader = ","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

map ,, :keepp /<++><CR>ca<
imap ,, <esc>:keepp /<++><CR>ca<

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'github/copilot.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
"Plug 'arcticicestudio/nord-vim'
"Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'  " Kanagawa uses the Everforest theme
Plug 'slugbyte/lackluster.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" avante dependencies
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
" avante optional
Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
"Plug 'zbirenbaum/copilot.lua'
Plug 'MeanderingProgrammer/render-markdown.nvim'
" avante.nvim
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': { -> avante#build() }, 'on': 'AvanteAsk' }
call plug#end()

set title
set bg=light
set go=a


lua << EOF

vim.cmd.colorscheme("everforest")

lackluster = require('lackluster')

lackluster.setup({
    tweak_syntax = {
        comment = "#A0F0F0",
    },

})


--vim.cmd.colorscheme("lackluster")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { fg = "#FF0000", bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })


EOF


" Vim Sets
lua << EOF
vim.opt.scrolloff = 6

vim.opt.updatetime = 50

vim.opt.termguicolors = true
EOF


"Copilot
lua << EOF
-- Copilot settings
vim.g.copilot_enabled = 1
vim.g.copilot_assume_mapped = true

-- no tab
--vim.g.copilot_no_tab_map = true

-- Copilot keymapping ctrl+j
--vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
EOF

"set mouse=a set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Set the color for spell check underlines (red)
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red guisp=red

" Set the key mapping to toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_gb<CR>

" python path
let g:python3_host_prog = '/usr/bin/python3'

" latexmk path
let g:vimtex_compiler_progname = '/usr/bin/latexmk'

" VimTeX config
let g:tex_flavor='latex'
" This line sets the default TeX flavor to LaTeX. It ensures that VimTeX treats .tex files as LaTeX documents.

let g:vimtex_view_method='zathura'
" This specifies the PDF viewer to use. 'zathura' is set here, but you can change it to your preferred viewer.

let g:vimtex_quickfix_mode=0
" This disables the automatic opening of the quickfix window when there are compilation errors.

" Disable overfull/underfull hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = [ 'Underfull hbox', 'Overfull hbox', 'Package']
" This sets up filters to ignore common LaTeX warnings that might be distracting.
" It ignores warnings about underfull and overfull boxes, as well as package-related warnings.

" Configure the latexmk compiler
let g:vimtex_compiler_latexmk = { 'options' : [ '-pdf', '-shell-escape', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' ] }
" -pdf: Output a PDF file
" -shell-escape: Allow LaTeX to run external commands (needed for some packages)
" -verbose: Provide more detailed output
" -file-line-error: Show file names and line numbers for errors
" -synctex=1: Generate SyncTeX data for synchronization between source and output
" -interaction=nonstopmode: Keep compiling even if there are errors

" Use this command to manually toggle compilation
nnoremap <leader>ll :VimtexCompile<CR>
" This maps the <leader>ll key combination to toggle VimTeX compilation manually.

" LaTeX cleanup function
function! CleanupTeXFiles()
    let l:texfile = expand('%:t:r')
    let l:extensions_to_delete = ['aux', 'log', 'out', 'toc', 'lof', 'lot', 'bbl', 'blg', 'fls', 'fdb_latexmk', 'synctex.gz']

    for ext in l:extensions_to_delete
        let l:file = l:texfile . '.' . ext
        if filereadable(l:file)
            call delete(l:file)
        endif
    endfor
endfunction

augroup tex_cleanup
    autocmd!
    autocmd BufWritePost *.tex call CleanupTeXFiles()
    autocmd VimLeave *.tex call CleanupTeXFiles()
augroup END

" Adjust C-style indentation
set expandtab
set shiftwidth=4
set softtabstop=2
set tabstop=2
set cinoptions=(,W1,g1,i1,t0,+1,c1)

set smartindent

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex<CR>
	let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
  autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>
" Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
" Here leader is ";".
" So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
" if typed fast without the timeout.

" Streamlined LSP and Treesitter Setup

lua << EOF

-- Load the required modules as local variables
local lspconfig = require('lspconfig')
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
-- Set up mason
mason.setup()

-- List of LSP servers to set up
local servers = {
    -- Languages
    'pyright', 'jedi_language_server', 'pylsp', 'ruff_lsp', -- Python
    'ts_ls', 'flow', -- JavaScript/TypeScript
    'vimls', -- Vim script
    'clangd', -- C/C++
    'rust_analyzer', -- Rust
    'zls', -- Zig
    'gopls', 'golangci_lint_ls', -- Go
    'bashls', -- Bash
    'jsonls', -- JSON
    'html', -- HTML
    'cssls', 'stylelint_lsp', -- CSS
    'yamlls', -- YAML
    'vuels', 'volar', -- Vue
    'svelte', -- Svelte
    'graphql', -- GraphQL
    'dockerls', 'docker_compose_language_service', -- Docker
    'lua_ls', -- Lua
    'jdtls', -- Java
    'kotlin_language_server', -- Kotlin
    'metals', -- Scala
    'hls', -- Haskell
    'ocamllsp', -- OCaml
    'nimls', -- Nim
    'dartls', -- Dart
    'elixirls', 'elp', -- Elixir
    'erlangls', -- Erlang
    'r_language_server', -- R
    'julials', -- Julia
    'perlls', 'perlnavigator', -- Perl
    'groovyls', -- Groovy
    'clojure_lsp', -- Clojure
    'phpactor', 'intelephense', 'psalm', -- PHP
    'asm_lsp', -- Assembly
    'cmake', 'neocmake', -- CMake
    'powershell_es', -- PowerShell
    'sqlls', 'sqls', -- SQL
    'texlab', -- LaTeX
    'lemminx', -- XML
    'taplo', -- TOML
    'remark_ls', -- Markdown
    'astro', -- Astro
    'cssmodules_ls', -- CSS Modules
    'denols', -- Deno
    'eslint', -- ESLint
    'prismals', -- Prisma
    'puppet', -- Puppet
    'rnix', -- Nix
    'solargraph', 'ruby_lsp', 'sorbet', 'steep', 'typeprof', -- Ruby
    'terraformls', 'tflint', -- Terraform
    'vala_ls', -- Vala
    'verible', 'svlangserver', 'svls', -- SystemVerilog
    'vls', -- V language
    'wgsl_analyzer', -- WGSL
    'crystalline', -- Crystal
    'csharp_ls', -- C#
    'fsautocomplete', -- F#
    'fortls', -- Fortran
    'glsl_analyzer', -- GLSL
    'purescriptls', -- PureScript
    'qmlls', 'qml_lsp', -- QML
    'racket_langserver', -- Racket
    'solang', 'solidity_ls', 'solidity_ls_nomicfoundation', -- Solidity
    'spectral', -- OpenAPI/AsyncAPI linter
    'teal_ls', -- Teal language
    'angularls', -- Angular
    'ansiblels', -- Ansible
    'apex_ls', -- Salesforce Apex
    'awk_ls', -- AWK
    'azure_pipelines_ls', -- Azure Pipelines
    'beancount', -- Beancount
    'bicep', -- Bicep
    'clarity_lsp', -- Clarity
    'codeqlls', -- CodeQL
    'cucumber_language_server', -- Cucumber
    'dhall_lsp_server', -- Dhall
    'dotls', -- Dot
    'elmls', -- Elm
    'ember', -- Ember.js
    'emmet_ls', -- Emmet
    'flux_lsp', -- Flux
    'foam_ls', -- Foam
    'gradle_ls', -- Gradle
    'haxe_language_server', -- Haxe
    'jsonnet_ls', -- Jsonnet
    'lelwel_ls', -- Lelwel
    'nickel_ls', -- Nickel
    'opencl_ls', -- OpenCL
    'quick_lint_js', -- JavaScript
    'rescriptls', -- ReScript
    'robotframework_ls', -- Robot Framework
    'salt_ls', -- Salt
    'slint_lsp', -- Slint
    'smithy_ls', -- Smithy
    'snyk_ls', -- Snyk
    'stimulus_ls', -- Stimulus
    'theme_check', -- Shopify themes
    'vdmj', -- VDM
    'vim-language-server', -- Vim
    'zk', -- Zettelkasten

    -- Additional LSP servers

    -- 'als', -- Ada

    --als is deprecated, use github.com/TamaMcGlinn/nvim-lspconfig-ada instead.
    --Feature will be removed in lspconfig 0.2.0

    'antlersls', -- Antlers
    'biome', -- JavaScript/TypeScript (alternative)
    'bufls', -- Protocol Buffers
    'serve_d', -- D
    'dagger', -- Dagger
    'erg_language_server', -- Erg
    'hdl_checker', -- HDL
    'hhvm', -- Hack
    'hoon_ls', -- Hoon
    'idris2_lsp', -- Idris 2
    'lean3ls', -- Lean
    'mm0_ls', -- Metamath Zero
    'nushell', -- Nushell
    'ols', -- Odin
    'phan', -- PHP (alternative)
    'reason_ls', -- Reason
    'sourcery', -- Python refactoring
    'templ', -- Templ
    'visualforce_ls', -- Visualforce
    'vtsls', -- TypeScript (alternative)
}

-- Uncomment autoinstall to install new packages, otherwise becomes tedious and annoying
--mason_lspconfig.setup {
--    ensure_installed = servers
--}

-- Set up cmp
--local cmp = require('cmp')
--cmp.setup({
  --snippet = {
    --expand = function(args)
      --require('luasnip').lsp_expand(args.body)
    --end,
  --},
  --mapping = cmp.mapping.preset.insert({
    --['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),
    --['<CR>'] = cmp.mapping.confirm({ select = true }),
  --}),
  --sources = cmp.config.sources({
    --{ name = 'nvim_lsp' },
    --{ name = 'luasnip' },
  --}, {
    --{ name = 'buffer' },
  --})
--})

-- Set up LSP servers
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--for _, lsp in ipairs(servers) do
--    lspconfig[lsp].setup{
--        capabilities = capabilities,
--    }
--end

-- Python
lspconfig.pyright.setup{}
lspconfig.jedi_language_server.setup{}
lspconfig.pylsp.setup{}
lspconfig.ruff_lsp.setup{}

-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}
lspconfig.flow.setup{}

-- C/C++ configuration using clangd
lspconfig.clangd.setup{
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto"},
    root_dir = lspconfig.util.find_git_ancestor(
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git'
    ),
    single_file_support = true,
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
    },
}

-- Rust
lspconfig.rust_analyzer.setup{}

-- Zig
lspconfig.zls.setup{}

-- Go
lspconfig.gopls.setup{}
lspconfig.golangci_lint_ls.setup{}

-- Bash
lspconfig.bashls.setup{}

-- JSON
lspconfig.jsonls.setup{}

-- HTML
lspconfig.html.setup{}

-- CSS
lspconfig.cssls.setup{}
lspconfig.stylelint_lsp.setup{}

-- YAML
lspconfig.yamlls.setup{}

-- Vue
lspconfig.vuels.setup{}
lspconfig.volar.setup{}

-- Svelte
lspconfig.svelte.setup{}

-- GraphQL
lspconfig.graphql.setup{}

-- Docker
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}

-- Lua
lspconfig.lua_ls.setup{}

-- Java (jdtls) configuration
local jdtls_config = {
    cmd = {
        'jdtls',
        '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. vim.fn.getcwd(),
    },
    root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.junit.jupiter.api.Assumptions.*",
                    "org.junit.jupiter.api.DynamicContainer.*",
                    "org.junit.jupiter.api.DynamicTest.*",
                    "org.mockito.Mockito.*"
                },
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org"
                }
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                useBlocks = true,
            },
        }
    },
    init_options = {
        bundles = {}
    },
}

-- Java
lspconfig.jdtls.setup(jdtls_config)

-- Kotlin
lspconfig.kotlin_language_server.setup{}

-- Scala
lspconfig.metals.setup{}

-- Haskell
lspconfig.hls.setup{}

-- OCaml
lspconfig.ocamllsp.setup{}

-- Nim
lspconfig.nimls.setup{}

-- Dart
lspconfig.dartls.setup{}

-- Elixir
lspconfig.elixirls.setup{}
lspconfig.elp.setup{}

-- Erlang
lspconfig.erlangls.setup{}

-- R
lspconfig.r_language_server.setup{}

-- Julia
lspconfig.julials.setup{}

-- MATLAB
lspconfig.matlab_ls.setup{}

-- Perl
lspconfig.perlls.setup{}
lspconfig.perlnavigator.setup{}

-- Groovy
lspconfig.groovyls.setup{}

-- Clojure
lspconfig.clojure_lsp.setup{}

-- PHP
lspconfig.phpactor.setup{}
lspconfig.intelephense.setup{}
lspconfig.psalm.setup{}

-- Assembly
lspconfig.asm_lsp.setup{}

-- CMake
lspconfig.cmake.setup{}
lspconfig.neocmake.setup{}

-- PowerShell
lspconfig.powershell_es.setup{}

-- SQL
lspconfig.sqlls.setup{}
lspconfig.sqls.setup{}

-- LaTeX
lspconfig.texlab.setup{}

-- XML
lspconfig.lemminx.setup{}

-- TOML
lspconfig.taplo.setup{}

-- Markdown
lspconfig.remark_ls.setup({
    filetypes = { "markdown" },
    cmd = { "/home/enzo/.local/share/nvim/mason/bin/remark-language-server", "--stdio" },
    root_dir = lspconfig.util.root_pattern(".git", "package.json"),
    settings = {
        remark = {
            lint = {
                -- linting rules here
            },
            format = {
                -- formatting options here
            },
            plugins = {
                -- remark plugins here
            }
        }
    }
})

-- Astro
lspconfig.astro.setup{}

-- CSS Modules
lspconfig.cssmodules_ls.setup{}

-- Deno
lspconfig.denols.setup{}

-- ESLint
lspconfig.eslint.setup{}

-- Prisma
lspconfig.prismals.setup{}

-- Puppet
lspconfig.puppet.setup{}

-- Nix
lspconfig.rnix.setup{}

-- Ruby
lspconfig.solargraph.setup{}
lspconfig.ruby_lsp.setup{}
lspconfig.sorbet.setup{}
lspconfig.steep.setup{}
lspconfig.typeprof.setup{}

-- Terraform
lspconfig.terraformls.setup{}
lspconfig.tflint.setup{}

-- Vala
lspconfig.vala_ls.setup{}

-- SystemVerilog
lspconfig.verible.setup{}
lspconfig.svlangserver.setup{}
lspconfig.svls.setup{}

-- V language
lspconfig.vls.setup{}

-- WGSL
lspconfig.wgsl_analyzer.setup{}

-- Crystal
lspconfig.crystalline.setup{}

-- C#
lspconfig.csharp_ls.setup{}

-- F#
lspconfig.fsautocomplete.setup{}

-- Fortran
lspconfig.fortls.setup{}

-- GLSL
lspconfig.glsl_analyzer.setup{}

-- PureScript
lspconfig.purescriptls.setup{}

-- QML
lspconfig.qmlls.setup{}
lspconfig.qml_lsp.setup{}

-- Racket
lspconfig.racket_langserver.setup{}

-- Solidity
lspconfig.solang.setup{}
lspconfig.solidity_ls.setup{}
lspconfig.solidity_ls_nomicfoundation.setup{}

-- OpenAPI/AsyncAPI linter
lspconfig.spectral.setup{}

-- Teal language
lspconfig.teal_ls.setup{}

-- Angular
lspconfig.angularls.setup{}

-- Ansible
lspconfig.ansiblels.setup{}

-- Salesforce Apex
lspconfig.apex_ls.setup{}

-- AWK
lspconfig.awk_ls.setup{}

-- Azure Pipelines
lspconfig.azure_pipelines_ls.setup{}

-- Beancount
lspconfig.beancount.setup{}

-- Bicep
lspconfig.bicep.setup{}

-- Clarity
lspconfig.clarity_lsp.setup{}

-- CodeQL
lspconfig.codeqlls.setup{}

-- Cucumber
lspconfig.cucumber_language_server.setup{}

-- Dhall
lspconfig.dhall_lsp_server.setup{}

-- Dot
lspconfig.dotls.setup{}

-- Elm
lspconfig.elmls.setup{}

-- Ember.js
lspconfig.ember.setup{}

-- Emmet
lspconfig.emmet_ls.setup{}

-- Flux
lspconfig.flux_lsp.setup{}

-- Foam
lspconfig.foam_ls.setup{}

-- Gradle
lspconfig.gradle_ls.setup{}

-- Haxe
lspconfig.haxe_language_server.setup{}

-- Jsonnet
lspconfig.jsonnet_ls.setup{}

-- Lelwel
lspconfig.lelwel_ls.setup{}

-- Nickel
lspconfig.nickel_ls.setup{}

-- OpenCL
lspconfig.opencl_ls.setup{}

-- JavaScript (alternative)
lspconfig.quick_lint_js.setup{}

-- ReScript
lspconfig.rescriptls.setup{}

-- Robot Framework
lspconfig.robotframework_ls.setup{}

-- Salt
lspconfig.salt_ls.setup{}

-- Slint
lspconfig.slint_lsp.setup{}

-- Smithy
lspconfig.smithy_ls.setup{}

-- Snyk
lspconfig.snyk_ls.setup{}

-- Stimulus
lspconfig.stimulus_ls.setup{}

-- Shopify themes
lspconfig.theme_check.setup{}

-- VDM
lspconfig.vdmj.setup{}

-- Vim
lspconfig.vimls.setup{
    -- Specify the command to start the language server
    cmd = { "vim-language-server", "--stdio" },

    -- File types that this server should be activated for
    filetypes = { "vim" },

    -- Root directory patterns to recognize the project
    root_dir = lspconfig.util.find_git_ancestor,

    -- Server-specific settings
    settings = {
        vimls = {
            -- Enable/disable specific features
            diagnostic = {
                enable = true,
            },
            indexes = {
                count = 3,
                gap = 100,
                projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                runtimepath = true,
            },
            iskeyword = "@,48-57,_,192-255,-#",
            runtimepath = "",
            suggest = {
                fromRuntimepath = true,
                fromVimruntime = true,
            },
            vimruntime = "",
        },
    },
}
-- Zettelkasten
lspconfig.zk.setup{}

-- Antlers
lspconfig.antlersls.setup{}

-- JavaScript/TypeScript (alternative)
lspconfig.biome.setup{}

-- Protocol Buffers
lspconfig.bufls.setup{}

-- D
lspconfig.serve_d.setup{}

-- Dagger
lspconfig.dagger.setup{}

-- Erg
lspconfig.erg_language_server.setup{}

-- HDL
lspconfig.hdl_checker.setup{}

-- Hack
lspconfig.hhvm.setup{}

-- Hoon
lspconfig.hoon_ls.setup{}

-- Idris 2
lspconfig.idris2_lsp.setup{}

-- Lean
lspconfig.lean3ls.setup{}

-- Metamath Zero
lspconfig.mm0_ls.setup{}

-- Nushell
lspconfig.nushell.setup{}

-- Odin
lspconfig.ols.setup{}

-- PHP (alternative)
lspconfig.phan.setup{}

-- Reason
lspconfig.reason_ls.setup{}

-- Python refactoring
lspconfig.sourcery.setup{}

-- Templ
lspconfig.templ.setup{}

-- Visualforce
lspconfig.visualforce_ls.setup{}

-- TypeScript (alternative)
lspconfig.vtsls.setup{}

-- Note: 'als' (Ada Language Server) is deprecated and not included

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",          -- Lua programming language
        "vim",          -- Vim script
        "vimdoc",       -- Vim help files
        "query",        -- Treesitter query language
        "python",       -- Python programming language
        "javascript",   -- JavaScript programming language
        "typescript",   -- TypeScript programming language
        "c",            -- C programming language
        "cpp",          -- C++ programming language
        "rust",         -- Rust programming language
        "go",           -- Go programming language
        "java",         -- Java programming language
        "html",         -- HTML markup language
        "css",          -- CSS stylesheet language
        "json",         -- JSON data format
        "yaml",         -- YAML data format
        "toml",         -- TOML configuration format
        "markdown",     -- Markdown markup language
        "bash",         -- Bash shell scripting
        "dockerfile",   -- Dockerfile syntax
        "regex",        -- Regular expressions
        "comment",      -- Special highlighting for comments
        "sql",          -- SQL database query language
        "swift",        -- Swift programming language
        "ruby",         -- Ruby programming language
        "php",          -- PHP programming language
        "r",            -- R programming language
        "bibtex",       -- BibTeX bibliography format
        "scala",        -- Scala programming language
        "haskell",      -- Haskell programming language
        "julia",        -- Julia programming language
        "kotlin",       -- Kotlin programming language
        "dart",         -- Dart programming language
        "elixir",       -- Elixir programming language
        "erlang",       -- Erlang programming language
        "clojure",      -- Clojure programming language
        "ocaml",        -- OCaml programming language
        "cmake",        -- CMake build system
        "make",         -- Makefile syntax
        "ninja",        -- Ninja build system
        "perl",         -- Perl programming language
        "zig",          -- Zig programming language
        "nix",          -- Nix expression language
        "scheme",       -- Scheme programming language
        "svelte",       -- Svelte framework
        "vue",          -- Vue.js framework
        "tsx",          -- TypeScript JSX
        "graphql",      -- GraphQL query language
        "solidity",     -- Solidity smart contract language
        "proto",        -- Protocol Buffers
        "glsl",         -- OpenGL Shading Language
        "hlsl",         -- High-Level Shading Language
        "wgsl",         -- WebGPU Shading Language
        "cuda",         -- CUDA C++
        "tlaplus",      -- TLA+ specification language
        "asm",          -- Assembly language
        "verilog",      -- Verilog hardware description language
        "pascal",       -- Pascal programming language
        "fish",         -- Fish shell scripting
        "fortran",      -- Fortran programming language
    },
    sync_install = false,
    auto_install = true,
    highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    },
    -- You can add more modules here as needed, such as:
    indent = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}

-- Keep LSP diagnostics visible in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

--close the lua block
EOF

lua << EOF
EOF

silent! source ~/.config/nvim/shortcuts.vim
