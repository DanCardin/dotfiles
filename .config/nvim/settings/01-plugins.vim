function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

let g:python_host_prog='/home/dan/.miniconda3/envs/default/bin/python'
" let g:python3_host_prog='/home/dan/.miniconda3/envs/default/bin/python'
let g:python3_host_prog='/home/dan/.pyenv/versions/default/bin/python'

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

Plug 'Konfekt/FastFold'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Valloric/MatchTagAlways'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-buftabline'
Plug 'ap/vim-css-color'
" Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'itchyny/lightline.vim'
Plug 'jason0x43/vim-js-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'lilydjwg/python-syntax'
Plug 'kshenoy/vim-signature'
Plug 'leafgarland/typescript-vim'
Plug 'lfv89/vim-interestingwords'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'mhartington/deoplete-typescript'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'roxma/vim-tmux-clipboard'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/impsort.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/XML-Folding'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
Plug 'chrisbra/csv.vim'
Plug 'lambdalisue/vim-pyenv'

if has('python')
  Plug 'simnalamburt/vim-mundo'
endif

if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  if has('patch-7.0.167')
    Plug 'majutsushi/tagbar'
  endif
endif

call plug#end()

filetype plugin indent on
syntax on

" kh3phr3n/python-syntax
let g:python_highlight_all = 1

" alvan/vim-closetag
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"

" Raimondi/delimitMate
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1
imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"

" benekastah/neomake
" augroup neomake_after_save
"   autocmd! BufWritePost * Neomake
"   autocmd BufReadPost,BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
" augroup END
let g:neomake_python_enabled_makers = ['flake8', 'prospector', 'mypy']
let g:neomake_python_flake8_maker = {
  \ 'exe': '/home/dan/.pyenv/versions/default/bin/flake8',
  \ 'args': ['--format=default --max-line-length=100'],
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
  \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
  \ }
let g:neomake_python_prospector_maker = {
  \ 'exe': '/home/dan/.pyenv/versions/default/bin/prospector',
  \ 'args': ['-o', 'pylint', '-M', '--absolute-paths', '%:p'],
  \ 'errorformat':
    \ '%-G%.%#module named%.%#,' .
    \ '%f:%l:%c [%t%n%.%#] %m,' .
    \ '%f:%l: [%t%n%.%#] %m,' .
    \ '%f:%l: [%.%#] %m,' .
    \ '%f:%l:%c [%.%#] %m',
  \ }
let g:neomake_python_mypy_maker = {
  \ 'exe': '/home/dan/.pyenv/versions/default/bin/mypy',
  \ 'args': ['--silent-imports', '--fast-parser'],
  \ 'errorformat':
      \ '%E%f:%l: error: %m,' .
      \ '%W%f:%l: warning: %m,' .
      \ '%I%f:%l: note: %m',
  \ }
" let g:neomake_python_exe='/home/dan/.miniconda3/envs/default/bin/python'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_rust_enabled_makers = []
" let g:neomake_error_sign = {'text': 'XX', 'texthl': 'ErrorMsg'}
" let g:neomake_warning_sign = {'text': '>>', 'texthl': 'WarningMsg'}

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

"junegunn/fzf.vim
nnoremap <C-p> :Files<cr>
map <Leader>o :GitFiles<cr>
map gb :Buffers<CR>

" justinmk/vim-sneak
let g:sneak#streak=1

" simnalamburt/vim-mundo
nnoremap <F6> :MundoToggle<CR>

" scrooloose/nerdtree
map <F5> :NERDTreeToggle<CR>

" majutsushi/tagbar
nnoremap <C-s> :TagbarToggle<cr>

" ntpeters/vim-better-whitespace
let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave

" ludovicchabant/vim-gutentags
let g:gutentags_tagfile=".tags"

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
noremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:neosnippet_complete()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif
  if pumvisible()
    return "\<c-n>"
  else
    return "\<tab>"
  endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()

" tweekmonster/impsort.vim
let g:impsort_textwidth=79
let g:impsort_start_nextline=1
let g:impsort_method_module=['alpha', 'depth', 'length']
autocmd BufWritePre *.py ImpSort!

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'ale' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'ale': 'ALEGetStatusLine',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" luochen1990/rainbow
let g:rainbow_active=1

" Yggdroot/indentLine
let g:indentLine_char='¦'  "┆
let g:indentLine_enabled=1

" w0rp/ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
\   'python': ['mypy', 'flake8'],
\}
let g:ale_mypy_options = '--ignore-missing-imports'
let g:ale_python_mypy_options = '--ignore-missing-imports --python-version 3.6'

" chrisbra/csv.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
let g:csv_no_column_highlight = 1
