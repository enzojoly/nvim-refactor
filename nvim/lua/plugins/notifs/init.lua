-- plugins/notifs/init.lua
-- Entry point for notification-related plugin configurations

return {
    -- This file loads all the notification-related plugins
    require("plugins.notifs.fidget"),
    require("plugins.notifs.noice"),
    require("plugins.notifs.which-key"),
}
