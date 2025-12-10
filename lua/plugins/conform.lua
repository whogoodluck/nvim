return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
				lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "black" },
      },

      format_on_save = function()
        return {
          timeout_ms = 1000,
          lsp_fallback = true,
        }
      end,
    })

    -- Format keymap
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true })
    end, { desc = "Format" })
  end,
}

