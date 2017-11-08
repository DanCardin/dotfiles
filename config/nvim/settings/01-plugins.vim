function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

let g:python_host_prog = $HOME . '/.pyenv/versions/default/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/default/bin/python'

call plug#begin($HOME . '/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

" Visual Additions
Plug 'airblade/vim-gitgutter'              " Show git modifications in the gutter
Plug 'ap/vim-buftabline'                   " Show buffers on the tabline
Plug 'hkupty/iron.nvim'                    " Support REPLs
Plug 'itchyny/lightline.vim'               " Fancy statsline
Plug 'kshenoy/vim-signature'               " Show marks in the gutter
Plug 'roxma/nvim-completion-manager'       " Code completions
Plug 'scrooloose/nerdtree'                 " File tree
Plug 'simnalamburt/vim-mundo'              " Undo tree

" Colors and Highlighting
Plug 'Valloric/MatchTagAlways'             " Always highlight current context's tags
Plug 'ap/vim-css-color'                    " Highlight css hex colors as their color
Plug 'elzr/vim-json'                       " Highlight keys/values differently
Plug 'junegunn/fzf.vim'                    " Fuzzy search for files
Plug 'lfv89/vim-interestingwords'          " Highlight marked words
Plug 'luochen1990/rainbow'                 " Highlight nested braces differently
Plug 'machakann/vim-highlightedyank'       " Highlight yanked text
Plug 'morhetz/gruvbox'                     " Theme
Plug 'ntpeters/vim-better-whitespace'      " Highlight trailing whitespace
Plug 'unblevable/quick-scope'              " f and F highlight first and other char instances

" Filetype Support
Plug 'alvan/vim-closetag'                  " Match XML tags
Plug 'chrisbra/csv.vim'                    " Show csvs prettily
Plug 'fisadev/vim-isort'                   " Sort python imports
Plug 'hynek/vim-python-pep8-indent'        " Better indent for python
" Plug 'jason0x43/vim-js-indent'             " Better indent for javascript/typescript
" Plug 'jelera/vim-javascript-syntax'        " Better syntax for javascript/typescript
Plug 'lambdalisue/vim-pyenv'               " Auto-use pyenv
Plug 'leafgarland/typescript-vim'          " Better syntax for typescript
Plug 'lilydjwg/python-syntax'              " Better syntax for python
Plug 'rust-lang/rust.vim'                  " Rust syntax
Plug 'tpope/vim-markdown'                  " Markdown syntax
Plug 'vim-scripts/XML-Folding'             " Fold XML tags

" Actions
" Plug 'Shougo/neosnippet'                   " Snippet engine
Plug 'Yggdroot/indentLine'                 " Highlight indents
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/vim-easygit'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'                   " Match matchable symbol pairs
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jreybert/vimagit'                    " Git actions
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'                      " Move blocks of text
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'pbrisbin/vim-restore-cursor'         " Restore cursor to its original position
Plug 'roxma/vim-paste-easy'                " Set and unset paste
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'                    " Automatically set tabwidth based on file
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

" vimwiki/vimwiki
let g:vimwiki_map_prefix = '<Leader>e'

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

"junegunn/fzf.vim
nnoremap <C-p> :Files<cr>
map <Leader>o :GitFiles<cr>
map <Leader>b :Buffers<CR>

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
let g:gutentags_ctags_tagfile=".tags"

" Shougo/neosnippet
" let g:neosnippet#disable_runtime_snippets=0
" imap <expr><TAB> <SID>neosnippet_complete()

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'ale' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'ale': 'LinterStatus',
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
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0

" w0rp/ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = [' %d', '⚠ %d', '']
let g:ale_linters = {
\   'python': ['pylint', 'mypy', 'flake8', 'pydocstyle'],
\}
let g:ale_sign_column_always = 1
let g:ale_python_mypy_options = '--ignore-missing-imports --python-version 3.6'
nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

" chrisbra/csv.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
let g:csv_no_column_highlight = 1

" fisadev/vim-isort
let g:vim_isort_python_version = 'python3'
autocmd BufWritePre *.py Isort

" chemzqm/vim-easygit
let g:easygit_enable_command = 1

" haya14busa/incsearch.vim
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" haya14busa/incsearch-fuzzy.vim
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ }

map <silent> <Leader>gh :call LanguageClient_textDocument_hover()<CR>
map <silent> <Leader>gd :call LanguageClient_textDocument_definition()<CR>
map <silent> <Leader>gr :call LanguageClient_textDocument_rename()<CR>
map <silent> <Leader>gs :call LanguageClient_textDocument_documentSymbol()<CR>


" lfv89/vim-interestingwords
map <leader>i :call InterestingWords('n')<cr>
map <leader>I :call UncolorAllWords()<cr>

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" tpope/vim-obsession
map <F2> :Obsess<cr>
map <F3> :source Session.vim<cr>

" hkupty/iron.nvim
let g:iron_map_defaults=0
map <C-b> :IronRepl<cr>
nmap <Leader>tt <Plug>(iron-send-motion)
vmap <Leader>tt <Plug>(iron-send-motion)

" roxma/nvim-completion-manager
imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(cm_inject_snippet)\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (has_key(v:completed_item,'snippet')?"\<C-U>":"\<CR>")
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c

" roxma/vim-paste-easy
let g:paste_char_threshold = 8
