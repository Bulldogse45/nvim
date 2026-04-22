return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "eslint", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf, remap = false }
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = ev.buf,
              command = "EslintFixAll",
            })
          end
        end,
      })

      vim.lsp.config("ts_ls", {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = { "javascript", "typescript", "vue" },
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "eslint" })
    end,
  },
}
