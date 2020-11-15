local vim = vim
local mappings = require('self.mappings')


local o = vim.o
local wo = vim.wo
local g = vim.g
local a = vim.api

g.python_host_prog = "~/.nix-profile/bin/nvim-python3"
g.python3_host_prog = "~/.nix-profile/bin/nvim-python3"

-- Space is <Leader>
g.mapleader = " "
g.maplocalleader = " "

o.updatetime = 50
o.foldlevelstart = 99 -- Don't autofold by default

o.termguicolors = true

o.ignorecase = true              -- Ignore case
o.confirm = true                 -- Disable 'no write'
o.scrolloff = 4                  -- Lines from the cursor
o.incsearch = true               -- Move cursor during search
o.splitright = true              -- Splits open on the right
o.splitbelow = true              -- Splits open on the bottom
o.wildmenu = true                -- Command line completion mode
o.wildmode = 'list:longest:full'
o.hlsearch = true                -- Highlight search results (enforce)
o.showmatch = true               -- Show matching brackets/parenthesis
o.showmode = false               -- Do not output message on the bottom
o.inccommand = 'nosplit'         -- Show effects of command as you type in a split
o.tabstop = 4                    -- Tabs are 4 spaces long
o.shiftwidth = 4                 -- Number of space for autoindent
o.expandtab = true               -- expand tab into space by default
o.shortmess = vim.o.shortmess .. 'c'
o.smartindent = true             -- auto indent on new line (brackets for instance)
o.textwidth = 500

a.nvim_exec([[
set number
set relativenumber
set colorcolumn=100
set completeopt=menuone,noinsert,noselect
set nocursorline
set linebreak
if has("autocmd")
filetype plugin indent on
endif
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

autocmd Filetype help nmap <silent><buffer> q :q<CR>
]], '')

mappings.setup()
