set autoindent                  " Copy indent level from previous line for new lines
set autoread                    " Automatically reload the file on change
set background=dark             " Enables dark background
set backspace=eol,start,indent  " Sensible backspace
set cmdheight=1                 " Sets the height of the cmd window at the bottom
set cursorcolumn                " Highlights vertical column on cursor
set cursorline                  " Highlights horizontal line on cursor
set encoding=utf8               " Default encoding
set expandtab                   " Tabs are spaces
set ffs=unix,dos,mac            " The order to try le formatting
set foldlevelstart=99           " Don't autofold by default
set hid                         " Hide (not close) buffers when opening new files
set history=700                 " Sets the command history length
set hlsearch                    " Highlight matches
set ignorecase                  " Ignores case in / search
set incsearch                   " Search as you type
set langmenu=en                 " Sets the UI language
set laststatus=2                " Always show the last command
set lazyredraw                  " Only redraw when necessary
set lbr                         " Enable linebreaking
set magic                       " Makes regex searches default available
set mat=2                       " Blinks matching brackets
set mouse=a                     " Enable mouse for all things
set nobackup                    " Don't create backup files, that's what git's for
set noshowmode                  " Don't show the mode, its in the statusline
set noswapfile                  " Don't create swap files
set nowb                        " Disable write backup
set nowrap                      " Don't wrap text
set number                      " Enable line numbers
set pumheight=4                 " Set the height of the autocomplete menu
set relativenumber              " Make the line number relative
set shiftwidth=4                " Number of spaces replaced per tab
set showcmd                     " Shows the current command on bottom right
set showmatch                   " Highlights matching [{()}]
set smartcase                   " When there's capital in search, be case sensitive
set smartindent                 " Tab to the previous line's indentation
set smarttab                    " Delete per tab rather than per space
set so=5                        " Minimum number of lines from the top or bottom
set stal=1                      " Only show tabline if there's multiple tabs
set swb=useopen,usetab,newtab   " For buffers, first use open buffers, then..., then...
set t_Co=256                    " Enabled 256 colors
set tabstop=4                   " Number of visual spaces per TAB
set timeoutlen=50               " Lowers the timeout
set tm=500                      " Time to wait for a command to complete
set ttyfast                     " Lessens lag in some cases
set tw=500                      " Start linebreaking at 500 chars
set vb t_vb=                    " Disables the error bells
set viminfo^=%                  " Remember info about open buffers on close
set whichwrap+=<,>,h,l          " Wraps on h and l
set wildmenu                    " Enables commandline completions
set wildmode=list:longest:full  " Sets the style of completion for wildmenu
set winaltkeys=no               " Allow for Alt in bindings
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Remap VIM 0 to first non-blank character
map 0 ^
" Stop space from searching
noremap <Space> <Nop>
" Space is <Leader>
let mapleader = "\<Space>"
