-- plugins/notifs/init.lua
-- Entry point for notification-related plugin configurations

return {
  -- This file loads all the notification-related plugins
  require("plugins.ux.lualine"),
  require("plugins.ux.nerdtree"),
  require("plugins.ux.undotree"),
  require("plugins.ux.vimtex"),
  require("plugins.ux.winshift"),
  require("plugins.ux.yazi"),
}
