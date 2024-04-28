return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local readtime = require("readtime") -- get wordcount on txt and md files

    lualine.setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          -- { "fileformat" },
          { "filetype" },
          {
            readtime.get_word_count,
            cond = readtime.is_text_file,
          },
        },
      },
    })
  end,
}
