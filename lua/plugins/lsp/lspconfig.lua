return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Keymaps for LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, noremap = true, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- vim.keymap.set("n", "<leader>cf", function()
				--   vim.lsp.buf.format({ async = true })
				-- end, opts)
			end,
		})

		-- Check Neovim version and use appropriate API
		local nvim_version = vim.version()
		local use_new_api = nvim_version.minor >= 11

		local servers = {
			lua_ls = {},
			pyright = {},
			ts_ls = {},
		}

		if use_new_api then
			-- Use new vim.lsp.config API for Neovim 0.11+
			for server_name, config in pairs(servers) do
				local final_config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config)

				vim.lsp.config[server_name] = final_config
				vim.lsp.enable(server_name)
			end
		else
			-- Use legacy lspconfig API for older versions
			local lspconfig = require("lspconfig")
			for server_name, config in pairs(servers) do
				local final_config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config)

				lspconfig[server_name].setup(final_config)
			end
		end
	end,
}
