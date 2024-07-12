vim.g.mapleader = " "
function insertFullPath()
  local filepath = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', filepath) -- write to clippoard
end
vim.api.nvim_set_option("clipboard","unnamed")
vim.keymap.set('n', '<leader>cfp', insertFullPath, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "H", ":tabp<enter>")
vim.keymap.set("n", "L", ":tabn<enter>")
vim.keymap.set("n", "<leader>qqq", ":bufdo bd<enter>:q<enter>")
