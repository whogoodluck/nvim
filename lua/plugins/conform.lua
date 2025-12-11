return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufWritePre" },
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
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
		})

		-- Format keymap
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format" })
	end,
}
