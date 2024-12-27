local vim = vim

local function setup()
	vim.keymap.set("i", "<c-c>", "<esc>")

	-- Move to beginning/end of line
	vim.keymap.set("n", "0", "^")
	vim.keymap.set("n", "B", "^")
	vim.keymap.set("n", "E", "$")

	-- Stop space from searching
	vim.keymap.set("n", "<space>", "<nop>")

	-- No Ex mode
	vim.keymap.set("n", "Q", "<nop>")

	-- Half page up/down
	vim.keymap.set("n", "K", "<c-u>")
	vim.keymap.set("n", "J", "<c-d>")

	-- Copy to clipboard
	vim.keymap.set({ "n", "v" }, "Y", '"+y')

	-- Copy/paste to system clipboard
	vim.keymap.set("v", "<c-c>", '"*y')
	vim.keymap.set("i", "<c-p>", '<c-o> "*p')

	-- Start a command
	vim.keymap.set({ "n", "v" }, "<leader>;", ":")

	-- Quick save
	vim.keymap.set("n", "<leader>w", ":w!<cr>")

	vim.keymap.set("n", "<leader>q", ":Bdelete<cr>", { silent = true })

	-- Splits
	vim.keymap.set("n", "<leader>\\h", ":sp<cr>")
	vim.keymap.set("n", "<leader>\\v", ":vs<cr>")

	-- Force update the current file
	vim.keymap.set("n", "<leader>e", ":e!<cr>")

	-- Terminal settings
	vim.keymap.set("t", ";<esc>", "<C-\\><C-n>")
	vim.keymap.set("t", "<c-h>", "<C-\\><C-n><C-w>h")
	vim.keymap.set("t", "<c-j>", "<C-\\><C-n><C-w>j")
	vim.keymap.set("t", "<c-k>", "<C-\\><C-n><C-w>k")
	vim.keymap.set("t", "<c-l>", "<C-\\><C-n><C-w>l")

	-- Delete all buffers but the current one
	vim.keymap.set("n", "<leader>Q", function()
		local current_buf = vim.api.nvim_get_current_buf()
		for _, buf in pairs(vim.api.nvim_list_bufs()) do
			if current_buf ~= buf then
				vim.api.nvim_buf_delete(buf, {})
			end
		end
	end)

	vim.cmd([[
	au FileType markdown,rmd,rst imap ;= <esc>yypv$r=o
	au FileType markdown,rmd,rst imap ;- <esc>yypv$r-o
	]])

	-- Duplicate line
	vim.keymap.set("i", "<C-d>", "<esc>yypgi")
	vim.keymap.set("n", "<C-d>", "yyp<c-p>")
end

return {
	setup = setup,
}
