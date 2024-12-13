return {
  "rymdlego/readtime.nvim",
  cmd = "ReadTime",
  config = function()
    require("readtime").setup({
      wpm = 200,
    })
  end,
}
