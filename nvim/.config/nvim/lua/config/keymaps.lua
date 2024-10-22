vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "<C-l>", "<ESC>", { desc = "Exit insert mode with Ctrl-l" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- splits
keymap.set("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tabs
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- save and exit
keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit buffer" })
keymap.set("n", "<leader>xx", "<cmd>x<CR>", { desc = "Save and quit buffer" })
keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })
keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all buffers" })
keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Save all buffers" })
keymap.set("n", "<leader>xa", "<cmd>xa<CR>", { desc = "Save and quit all buffers" })

-- md preview
keymap.set("n", "<leader>gl", "<cmd>Glow<CR>", { desc = "Preview md file with Glow" })

-- x to delete but don't stick in copy buffer
keymap.set("n", "x", '"_x', { desc = "Delete to black hole register" })

-- git
keymap.set("n", "<leader>ga", "<cmd>Git add %<CR>", { desc = "Git add this file" })
keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
keymap.set("n", "<leader>gp", "<cmd>Git pull<CR>", { desc = "Git pull from repo" })
