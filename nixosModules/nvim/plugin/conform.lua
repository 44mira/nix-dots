require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		-- python = { 'black' },
		-- You can use a sub-list to tell conform to run *until* a formatter
		-- is found.
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		-- bash = { 'shfmt' },
		-- xml = { 'xmlformatter' },
	},
})
