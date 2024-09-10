local M = {}

-- Toggle wrap
function M.toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap
  print("Wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end

-- Toggle number
function M.toggle_number()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
  print("Line numbers: " .. (vim.wo.number and "ON" or "OFF"))
end

-- Toggle spell checking
function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell
  print("Spell check: " .. (vim.wo.spell and "ON" or "OFF"))
end

-- Center cursor
function M.center_cursor()
  local win_view = vim.fn.winsaveview()
  vim.cmd("normal! zz")
  vim.fn.winrestview(win_view)
end

-- Smart indent
function M.smart_indent()
  local line = vim.fn.getline('.')
  local indent = vim.fn.indent('.')
  local nextline = vim.fn.getline(vim.fn.line('.') + 1)
  local nextindent = vim.fn.indent(vim.fn.line('.') + 1)

  if line:match('^%s*$') then
    if nextline:match('^%s*$') or nextindent < indent then
      vim.cmd('normal! 0d$')
    else
      vim.cmd('normal! >>')
    end
  else
    vim.cmd('normal! >>')
  end
end

-- Toggle colorcolumn
function M.toggle_colorcolumn()
  if vim.wo.colorcolumn == "" then
    vim.wo.colorcolumn = "80"
  else
    vim.wo.colorcolumn = ""
  end
  print("Color column: " .. (vim.wo.colorcolumn ~= "" and "ON" or "OFF"))
end

-- Format buffer
function M.format_buffer()
  vim.lsp.buf.format({ async = true })
end

-- Toggle zen mode (requires 'folke/zen-mode.nvim' plugin)
function M.toggle_zen_mode()
  require("zen-mode").toggle({
    window = {
      width = .85,
      options = {
        number = false,
        relativenumber = false,
      }
    },
  })
end

return M
