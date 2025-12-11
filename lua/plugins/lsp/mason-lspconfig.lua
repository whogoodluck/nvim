return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"tailwindcss",
					"dockerls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"eslint_d",
					"pylint",
					"golangcilint",
					"shellcheck",
				},
				automatic_installation = true,
			})
		end,
	},
}
