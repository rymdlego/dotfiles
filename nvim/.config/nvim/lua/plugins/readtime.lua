return {
  "rymdlego/readtime.nvim",
  cmd = "ReadTime",
  config = function()
    require("readtime").setup({
      wpm = 200,
    })
    -- set keymaps
    -- local keymap = vim.keymap
    --
    -- keymap.set("n", "<leader>rt", "<cmd>ReadTime<cr>", { desc = "Get wordcount and estimated read time" })

  end,
}

