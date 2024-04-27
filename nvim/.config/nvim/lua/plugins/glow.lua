return {
  "ellisonleao/glow.nvim",
  cmd = "Glow",
  config = function()
    require("glow").setup({
      style = "~/.config/glow/frappe.json",
      width = 120,
    })
    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>g", "<cmd>Glow<cr>", { desc = "Open up Glow markdown reader" })
  end,
}
