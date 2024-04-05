vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "H", ":tabp<enter>")
vim.keymap.set("n", "L", ":tabn<enter>")
vim.keymap.set("n", "<leader>qqq", ":bufdo bd<enter>:q<enter>")
