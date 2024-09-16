-- Key mappings for Neovim

-- Updated map function using vim.keymap.set
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Move by visual lines (wrapped lines)
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Move by actual lines (classic Vim behaviour)
map('n', 'J', 'j')
map('n', 'K', 'k')

-- Search for <++> placeholders
map('', ',,', ':keepp /<++><CR>ca<')

-- NERDTree toggle
map('n', '<leader>n', ':NERDTreeToggle<CR>')

-- Spell-check toggle (set to English US)
map('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>')

-- Split navigation shortcuts
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Replace 'ex' mode with 'gq' formatting
map('n', 'Q', 'gq')

-- Shortcut for checking file in shellcheck
map('n', '<leader>s', ':!clear && shellcheck -x %<CR>')

-- Open bibliography file in a split
map('n', '<leader>b', ':vsp<space>$BIB<CR>')

-- Open reference file in a split
map('n', '<leader>r', ':vsp<space>$REFER<CR>')

-- Shortcut for global search and replace
map('n', 'S', ':%s//g<Left><Left>')

-- Compile document
map('n', '<leader>c', ':w! \\| !compiler "%:p"<CR>')

-- Open corresponding .pdf/.html or preview
map('n', '<leader>p', ':!opout "%:p"<CR>')

-- Toggle hidden characters
local hidden_all = 0
local function toggle_hidden_all()
    if hidden_all == 0 then
        vim.o.list = true
        vim.o.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
        hidden_all = 1
    else
        vim.o.list = false
        hidden_all = 0
    end
end
map('n', '<leader>h', toggle_hidden_all)

-- Set the key mapping to toggle spell checking
map('n', '<F5>', ':setlocal spell! spelllang=en_gb<CR>')

-- Uncomment and adjust the following mappings as needed
--[[
-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Better paste
map("v", "p", '"_dP')

-- Insert mode mappings
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Terminal mappings
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
--]]
