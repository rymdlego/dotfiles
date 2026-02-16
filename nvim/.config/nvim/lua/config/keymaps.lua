vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- splits
keymap.set("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tabs (I don't use them...)
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- save and exit
keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit buffer" })
keymap.set("n", "<S-Q>Q", "<cmd>q<CR>", { desc = "Quit buffer" })
keymap.set("n", "<S-Q>F", "<cmd>qa!<CR>", { desc = "Quit all buffers without saving" })
keymap.set("n", "<S-Z>F", "<cmd>wa<CR>", { desc = "Save and quit all buffers" })
keymap.set("n", "<leader>xx", "<cmd>x<CR>", { desc = "Save and quit buffer" })
keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })
keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all buffers" })
keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Save all buffers" })
keymap.set("n", "<leader>xa", "<cmd>xa<CR>", { desc = "Save and quit all buffers" })

-- x to delete but don't stick in copy buffer
keymap.set("n", "x", '"_x', { desc = "Delete to black hole register" })

-- git keymaps are defined in plugins/neogit.lua and plugins/diffview.lua

-- lazy
keymap.set("n", "<s-L>L", "<cmd>Lazy update<CR>", { desc = "Lazy update" })

-- toggle line wrap
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

-- Oil
keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open up Oil" })
keymap.set("n", "<leader>fo", "<cmd>Oil --float<cr>", { desc = "Open up Oil in floating window" })

-- ZenMode
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Open up ZenMode" })

-- ReadTime
keymap.set("n", "<leader>rt", "<cmd>ReadTime<cr>", { desc = "Get wordcount and estimated read time" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git_bcommits<cr>", { desc = "Find file in previous git commits" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
keymap.set("n", "<leader>fd", "<cmd>Telescope zoxide list<cr>", { desc = "Fuzzy find zoxide directory" })
keymap.set("n", "<leader>fp", "<cmd>Telescope neoclip<cr>", { desc = "Fuzzy find copy/paste registers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Fuzzy find help tags" })
