return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.diff").setup()
    require("mini.icons").setup()
    require("mini.git").setup()
    require("mini.statusline").setup()
  end,
}
