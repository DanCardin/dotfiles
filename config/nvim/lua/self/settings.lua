local vim = vim

vim.g.python_host_prog = vim.env.HOME .. "/.nix-profile/bin/nvim-python3"
vim.g.python3_host_prog = vim.env.HOME .. "/.nix-profile/bin/nvim-python3"

vim.g.LargeFile = 2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1

-- Space is <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backup = false -- Don't create backup files, that's what git's for
vim.opt.breakat = " \t;:,.={([])}"
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2,min:40,sbr"
vim.opt.cmdheight = 1 -- Sets the height of the cmd window at the bottom
vim.opt.colorcolumn = "80,100,120"
vim.opt.completeopt = "menuone,noselect"
vim.opt.concealcursor = "c"
vim.opt.confirm = true -- Disable 'no write'
vim.opt.cpo:append("n")
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.expandtab = true -- expand tab into space by default
vim.opt.ffs = "unix,dos,mac" -- The order to try le formatting
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99 -- Don't autofold by default
vim.opt.foldmethod = "expr"
vim.opt.hidden = true
vim.opt.hlsearch = true -- Highlight search results (enforce)
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- Show effects of command as you type in a split
vim.opt.incsearch = true -- Move cursor during search
vim.opt.laststatus = 0
vim.opt.linebreak = true
vim.opt.listchars = { tab = "▸ ", trail = "•", extends = "»", precedes = "«", nbsp = "␣" }
vim.opt.magic = true -- Makes regex searches default available
vim.opt.mat = 2 -- Blinks matching brackets
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.nrformats = "hex"
vim.opt.number = true
vim.opt.pumheight = 4 -- Set the height of the autocomplete menu
vim.opt.relativenumber = true
vim.opt.scrolloff = 4 -- Lines from the cursor
vim.opt.sessionoptions:remove("options")
vim.opt.shada:prepend("%") -- Remember info about open buffers on close
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 4 -- Number of space for autoindent
vim.opt.shortmess:append("c")
vim.opt.showbreak = ">>"
vim.opt.showmatch = true -- Show matching brackets/parenthesis
vim.opt.showmode = false -- Do not output message on the bottom
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true -- When there's capital in search, be case sensitive
vim.opt.smartindent = true -- auto indent on new line (brackets for instance)
vim.opt.so = 5 -- Minimum number of lines from the top or bottom
vim.opt.splitbelow = true -- Splits open on the bottom
vim.opt.splitright = true -- Splits open on the right
vim.opt.stal = 1 -- Only show tabline if there's multiple tabs
vim.opt.swapfile = false -- Don't create swap files
vim.opt.swb = { "useopen", "usetab", "newtab" } -- For buffers, first use open buffers, then..., then...
vim.opt.tabstop = 4 -- Tabs are 4 spaces long
vim.opt.termguicolors = true
vim.opt.textwidth = 500 -- Start linebreaking at 500 chars
vim.opt.tm = 500 -- Time to wait for a command to complete
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.vb = false -- Disables the error bells
vim.opt.whichwrap:append("<,>,h,l") -- Wraps on h and l
vim.opt.wildignore:append("*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store")
vim.opt.wildignorecase = true
vim.opt.wildmenu = true -- Command line completion mode
vim.opt.wildmode = "list:longest:full" -- Sets the style of completion for wildmenu
vim.opt.winaltkeys = "no" -- Allow for Alt in bindings
vim.opt.writebackup = false -- Disable write backup
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.cpoptions = "aBeFscA_"

vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })
