vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- splits
map("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- save and exit
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit buffer" })
map("n", "<S-Q>Q", "<cmd>q<CR>", { desc = "Quit buffer" })
map("n", "<S-Q>F", "<cmd>qa!<CR>", { desc = "Quit all buffers without saving" })
map("n", "<S-Z>F", "<cmd>wa<CR>", { desc = "Save and quit all buffers" })
map("n", "<leader>xx", "<cmd>x<CR>", { desc = "Save and quit buffer" })
map("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })
map("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all buffers" })
map("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Save all buffers" })
map("n", "<leader>xa", "<cmd>xa<CR>", { desc = "Save and quit all buffers" })

-- x to delete but don't stick in copy buffer
map("n", "x", '"_x', { desc = "Delete to black hole register" })

map("n", "<s-L>L", function()
  vim.pack.update()
end, { desc = "Update plugins" })

-- toggle line wrap
map("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

-- Oil
map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })
map("n", "<leader>fo", "<cmd>Oil --float<CR>", { desc = "Open Oil in floating window" })

-- fzf-lua
map("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", function()
  require("fzf-lua").git_files()
end, { desc = "Fuzzy find git files in cwd" })
map("n", "<leader>fr", function()
  require("fzf-lua").oldfiles()
end, { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", function()
  require("fzf-lua").live_grep()
end, { desc = "Find string in cwd" })
map("n", "<leader>fc", function()
  require("fzf-lua").git_bcommits()
end, { desc = "Find file in previous git commits" })
map("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Fuzzy find buffers" })
map("n", "<leader>fd", function()
  require("fzf-lua").zoxide()
end, { desc = "Fuzzy find zoxide directory" })
map("n", "<leader>fh", function()
  require("fzf-lua").helptags()
end, { desc = "Fuzzy find help tags" })
