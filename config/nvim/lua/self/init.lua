require("self.settings")
require("impatient")
pcall(require, "packer_compiled")

require("self.mappings").setup()
require("self.plugins").setup()
require("self.autocmds").setup()

vim.cmd("colorscheme kanagawa")
