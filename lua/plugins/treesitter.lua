return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "c", "lua", "vim", "vimdoc", "query",
      "javascript", "typescript", "tsx", "python",
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c", "lua", "vim", "help", "query",
        "javascript", "typescript", "typescriptreact", "python",
      },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
