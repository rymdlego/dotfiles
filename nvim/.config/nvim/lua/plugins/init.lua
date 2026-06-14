vim.pack.add({
  { src = "https://github.com/projekt0n/github-nvim-theme", name = "github-theme" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
}, { confirm = false, load = true })

require("github-theme").setup({
  transparent_background = false,
})
vim.cmd.colorscheme("github_dark_dimmed")

require("oil").setup({
  columns = { "icon" },
  constrain_cursor = "editable",
  keymaps = {
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
    ["<C-u>"] = "actions.parent",
  },
  view_options = {
    is_hidden_file = function()
      return false
    end,
    is_always_hidden = function()
      return false
    end,
    natural_order = true,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  float = {
    padding = 2,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
})

require("fzf-lua").setup({ "telescope" })
