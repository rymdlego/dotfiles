return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
  config = function()
    require("ibl").setup({
      scope = { enabled = false }, -- remove that ugly white line
    })
  end,
}
