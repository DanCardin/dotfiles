set breakindent
set breakindentopt=shift:2,min:40,sbr
set breakat=" \t;:,.={([])}"
set cpo+=n
set showbreak=>>
set cmdheight=1                 " Sets the height of the cmd window at the bottom
set shortmess+=c
set nocursorcolumn              " Highlights vertical column on cursor
set nocursorline                " Highlights horizontal line on cursor
set expandtab                   " Tabs are spaces
set ffs=unix,dos,mac            " The order to try le formatting
set hidden                      " Hide (not close) buffers when opening new files
set langmenu=en                 " Sets the UI language
set lazyredraw                  " Only redraw when necessary
set magic                       " Makes regex searches default available
set mat=2                       " Blinks matching brackets
set nobackup                    " Don't create backup files, that's what git's for
set noswapfile                  " Don't create swap files
set nowb                        " Disable write backup
set pumheight=4                 " Set the height of the autocomplete menu
set smartcase                   " When there's capital in search, be case sensitive
set so=5                        " Minimum number of lines from the top or bottom
set signcolumn=yes
set stal=1                      " Only show tabline if there's multiple tabs
set swb=useopen,usetab,newtab   " For buffers, first use open buffers, then..., then...
set t_Co=256                    " Enabled 256 colors
set tm=500                      " Time to wait for a command to complete
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif
set tw=500                      " Start linebreaking at 500 chars
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

autocmd VimEnter * call s:setup()

function! s:setup() abort
  colorscheme doom-one
" colorscheme gruvbox-material

  lua require('self.plugins').setup()
  runtime macros/sandwich/keymap/surround.vim

  autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
  \ :lua require'lsp_extensions'.inlay_hints{
  \   prefix = ' » ',
    \   aligned = true,
    \   highlight = "NonText"
  \ }

  if exists('+colorcolumn')
    " :hi ColorColumn ctermbg=235 guibg=#2c2d27
    :hi ColorColumn ctermbg=235 guibg=#232323
    let &colorcolumn="80,100,120"
  endif
endfunction

lua require 'self.init'
autocmd BufWritePost plugins.lua PackerCompile
execute 'source ~/.config/nvim/plugins.vim'
execute 'source ~/.config/nvim/mappings.vim'

augroup gzip " {
  autocmd!
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre		*.gz !gunzip <afile>
  autocmd FileAppendPre		*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
augroup END " }

augroup LargeFile
  let g:large_file = 10485760 " 10MB

  autocmd!
  autocmd BufReadPre *
    \ let f=expand("<afile>") |
    \ if getfsize(f) > g:large_file |
      \ set eventignore+=FileType |
    \ else |
      \ set eventignore-=FileType |
    \ endif
augroup END

let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_disable_italic_comment = 1

hi CursorColumn ctermbg=233
hi CursorLine ctermbg=233

augroup your_config_scrollbar_nvim
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()

    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()

    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
augroup end
