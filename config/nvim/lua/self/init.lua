local vim = vim
local mappings = require("self.mappings")

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

o.hidden = true
o.ignorecase = true -- Ignore case
o.confirm = true -- Disable 'no write'
o.scrolloff = 4 -- Lines from the cursor
o.incsearch = true -- Move cursor during search
o.splitright = true -- Splits open on the right
o.splitbelow = true -- Splits open on the bottom
o.wildmenu = true -- Command line completion mode
o.wildmode = "list:longest:full"
o.hlsearch = true -- Highlight search results (enforce)
o.showmatch = true -- Show matching brackets/parenthesis
o.showmode = false -- Do not output message on the bottom
o.inccommand = "nosplit" -- Show effects of command as you type in a split
o.tabstop = 4 -- Tabs are 4 spaces long
o.shiftwidth = 4 -- Number of space for autoindent
o.expandtab = true -- expand tab into space by default
o.shortmess = vim.o.shortmess .. "c"
o.smartindent = true -- auto indent on new line (brackets for instance)
o.textwidth = 500
o.completeopt = "menu,menuone,noselect"

wo.number = true
wo.relativenumber = true
wo.cursorline = false
wo.cursorcolumn = false

wo.colorcolumn = "80,100,120"
o.colorcolumn = "80,100,120"

g.LargeFile = 2

a.nvim_exec(
  [[
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

set linebreak

if has("autocmd")
  filetype plugin indent on
endif

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

autocmd Filetype help nmap <silent><buffer> q :q<CR>

set breakindent
set breakindentopt=shift:2,min:40,sbr
set breakat=" \t;:,.={([])}"
set cpo+=n
set showbreak=>>
set cmdheight=1                 " Sets the height of the cmd window at the bottom
set shortmess+=c
set ffs=unix,dos,mac            " The order to try le formatting
set lazyredraw                  " Only redraw when necessary
set magic                       " Makes regex searches default available
set mat=2                       " Blinks matching brackets
set nobackup                    " Don't create backup files, that's what git's for
set noswapfile                  " Don't create swap files
set nowb                        " Disable write backup
set pumheight=4                 " Set the height of the autocomplete menu
set smartcase                   " When there's capital in search, be case sensitive
set so=5                        " Minimum number of lines from the top or bottom
set signcolumn=no
set stal=1                      " Only show tabline if there's multiple tabs
set swb=useopen,usetab,newtab   " For buffers, first use open buffers, then..., then...
set t_Co=256                    " Enabled 256 colors
set tm=500                      " Time to wait for a command to complete

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

set textwidth=500                      " Start linebreaking at 500 chars
set vb t_vb=                    " Disables the error bells
set shada^=%                    " Remember info about open buffers on close
set undofile
set whichwrap+=<,>,h,l          " Wraps on h and l
set wildmode=list:longest:full  " Sets the style of completion for wildmenu
set winaltkeys=no               " Allow for Alt in bindings
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set concealcursor=c
set shell=/bin/zsh
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set listchars=tab:▸\ ,trail:•,extends:»,precedes:«,nbsp:␣
set mouse=a
set nrformats=hex
set sessionoptions-=options

set showtabline=2
set guioptions-=e
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

au VimLeave * set guicursor=a:block-blinkon0

" Auto close popup menu when finish completion
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

execute 'source ~/.config/nvim/plugins.vim'
]],
  ""
)

require("self.plugins").setup()

a.nvim_exec(
  [[
colorscheme gruvbox-material

filetype plugin indent on

" Sudo save
command! W w !sudo tee % > /dev/null

command Wq wq
command Q q

augroup terminal_autocommands
    autocmd!

    " Search for the shell prompt
    function! GoToPrompt(flags) abort
        " Regexp representing my shell prompt
        let l:shell_prompt = ' [❯❮]$'
        call search(shell_prompt, a:flags)
    endfunction

    " Jump to the previous shell prompt
    autocmd TermOpen * noremap <buffer> <silent> <leader>tsp :call GoToPrompt('eb')<cr>

    " Jump to the next shell prompt
    autocmd TermOpen * noremap <buffer> <silent> <leader>tsn :call GoToPrompt('e')<cr>

    " Jump to the uppermost shell prompt
    autocmd TermOpen * nmap <buffer> <leader>tsg 1G<leader>tsn
    " Jump to the 2nd bottommost shell prompt
    autocmd TermOpen * nmap <buffer> <leader>tsG G<leader>tsp

augroup END
]],
  ""
)

mappings.setup()
