-- plugins/img-clip.lua
-- Configuration for img-clip plugin

return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    filetypes = {
      markdown = {
        url_encode_path = true,
        template = "![$CURSOR]($FILE_PATH)",
      },
      html = {
        template = '<img src="$FILE_PATH" alt="$CURSOR">',
      },
      tex = {
        template = [[
          \begin{figure}[h]
              \centering
              \includegraphics[width=0.8\textwidth]{$FILE_PATH}
              \caption{$CURSOR}
              \label{fig:$LABEL}
          \end{figure}
        ]],
      },
    },
    -- Default configuration for all filetypes
    default = {
      dir_path = "assets/imgs",
      file_name = "%Y-%m-%d-%H-%M-%S",
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
