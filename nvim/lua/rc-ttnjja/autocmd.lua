-- rc-ttnjja/autocmd.lua
-- Autocommands for Neovim

local autocmd = vim.api.nvim_create_autocmd

-- Automatically delete all trailing whitespace and newlines at end of file on save
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\n\+\%$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Add trailing newline for ANSI C standard
autocmd("BufWritePre", {
    pattern = {"*.c", "*.h"},
    command = [[%s/\%$/\r/e]],
})

-- Disable automatic commenting on newline
autocmd("FileType", {
    pattern = "*",
    command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
})

-- Automatically update config files when edited
autocmd("BufWritePost", {
    pattern = {"bm-files", "bm-dirs"},
    command = [[!shortcuts]],
})

-- Run xrdb whenever Xdefaults or Xresources are updated
autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"},
    command = [[set filetype=xdefaults]],
})

autocmd("BufWritePost", {
    pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"},
    command = [[!xrdb %]],
})

-- Recompile dwmblocks on config edit
autocmd("BufWritePost", {
    pattern = "~/.local/src/dwmblocks/config.h",
    command = [[!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }]],
})

-- Ensure files are read as desired
autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.ms", "*.me", "*.mom", "*.man"},
    command = [[set filetype=groff]],
})

autocmd({"BufRead", "BufNewFile"}, {
    pattern = "/tmp/calcurse*,~/.calcurse/notes/*",
    command = [[set filetype=markdown]],
})

autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.tex",
    command = [[set filetype=tex]],
})

-- Enable Goyo by default for mutt writing
autocmd({"BufRead", "BufNewFile"}, {
    pattern = "/tmp/neomutt*",
    callback = function()
        vim.g.goyo_width = 80
        vim.cmd('Goyo')
        vim.cmd('set bg=light')
        vim.keymap.set('n', 'ZZ', ':Goyo\\|x!<CR>', { buffer = true })
        vim.keymap.set('n', 'ZQ', ':Goyo\\|q!<CR>', { buffer = true })
    end,
})

-- When shortcut files are updated, renew bash and ranger configs with new material:
autocmd("BufWritePost", {
    pattern = {"bm-files", "bm-dirs"},
    command = [[!shortcuts]],
})
