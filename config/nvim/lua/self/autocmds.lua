local function setup()
	local hl_yank = vim.api.nvim_create_augroup("higlighted-yank", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", {
		pattern = "*",
		group = hl_yank,
		callback = function()
			vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
		end,
	})

	-- Enable normal "q" to close help menu
	local help = vim.api.nvim_create_augroup("help", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "help",
		group = help,
		callback = function()
			vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<cr>", { silent = true })
		end,
	})

	-- Set blinky cursor
	local cursor = vim.api.nvim_create_augroup("cursor", { clear = true })
	vim.api.nvim_create_autocmd("VimLeave", {
		pattern = "*",
		group = cursor,
		callback = function()
			vim.opt.guicursor = "a:block-blinkon0"
		end,
	})

	vim.api.nvim_add_user_command("Wq", "wq", {})
	vim.api.nvim_add_user_command("Q", "q", {})
	vim.api.nvim_add_user_command("W", "w !sudo tee % > /dev/null", { bang = true }) -- sudo save

	-- Auto close popup menu when finish completion
	local completion = vim.api.nvim_create_augroup("completion", { clear = true })
	vim.api.nvim_create_autocmd({ "InsertLeave", "CompleteDone" }, {
		group = completion,
		pattern = "*",
		callback = function()
			if vim.fn.pumvisible() == 0 then
				vim.cmd("pclose")
			end
		end,
	})
end

return {
	setup = setup,
}
