return {
  "echasnovski/mini.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  -- event = "VeryLazy",
  config = function()
    require("mini.git").setup()
    require("mini.statusline").setup()
    require("mini.diff").setup()
    require("mini.icons").setup()
  end,
}
