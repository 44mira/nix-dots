require("nvim-silicon").setup({

	font = "FantasqueSansM Nerd Font=20",
	theme = "1337",
	background_image = "/home/tyrael/Pictures/nixchan.png",

	tab_width = 2,
	line_pad = 1,
	no_window_controls = true,
	to_clipboard = true,
	no_line_number = true,
	no_round_corner = true,
	shadow_color = "#000000",

	-- get current buffer as title
	window_title = function()
		return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
	end,
})
