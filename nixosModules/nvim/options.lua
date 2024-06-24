-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save to clipboard
vim.o.clipboard = "unnamedplus"

-- Save undo history
vim.opt.undofile = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

-- tabstops
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.updatetime = 300

-- true color
vim.o.termguicolors = true

vim.o.mouse = "a"

-- set hl on search, clear on <ESC> in normal mode
vim.o.hlsearch = true

local bind = vim.keymap.set

-- [[ Fold settings ]] {{{1
FoldText = function()
	local foldStart = vim.fn.getline(vim.v.foldstart)
	local title = foldStart:match("%[%[ (.+) %]%] {{{.*") or foldStart:match("(.+){{{.*")
	local icon = " "

	return icon .. "[[ " .. title .. " ]] "
end

vim.o.foldmethod = "marker"
vim.o.foldtext = "v:lua.FoldText()"
vim.o.foldlevel = 0
vim.opt.fillchars = { eob = " ", fold = "⋯" }
-- }}}1

-- [[ Highlight on yank ]] {{{
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- }}}

-- [[ Format on save disable on command ]] {{{
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- }}}

-- [[ Sanity binds ]] {{{
bind("i", "jk", "<Esc>", { desc = "Normal mode" })
bind("n", "<leader>f", "<CMD>Oil<CR>", { desc = "Open Oil" })
bind("v", "<leader><leader>", function()
	require("nvim-silicon").clip()
end, { desc = "[ ][ ] Take code snapshot" })
-- }}}

-- [[ Buffer controls ]] {{{
bind("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Close active buffer" })
bind("n", "<leader>[", "<cmd>bp<CR>", { desc = "[[] Previous Buffer" })
bind("n", "<leader>]", "<cmd>bn<CR>", { desc = "[]] Next Buffer" })
---}}}

-- [[ Telescope ]] {{{
local builtin = require("telescope.builtin")
bind("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
bind("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
bind("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
bind("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
bind("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
bind("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
bind("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
bind("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
bind("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
bind("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
bind("n", "<leader>sa", "<cmd>Telescope aerial<CR>", { desc = "[S]earch [A]erial" })

-- Slightly advanced example of overriding default behavior and theme
bind("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
bind("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

bind("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- }}}
