-- plugins/vimwiki.lua
-- Configuration for VimWiki plugin

return {
  "vimwiki/vimwiki",
  event = "BufEnter *.wiki",
  config = function()
    vim.g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}
    vim.g.vimwiki_global_ext = 0
  end,
}
