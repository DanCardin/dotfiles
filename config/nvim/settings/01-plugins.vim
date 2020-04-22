let g:python_host_prog = $HOME . '/.nix-profile/bin/nvim-python'
let g:python3_host_prog = $HOME . '/.nix-profile/bin/nvim-python3'

call plug#begin($HOME . '/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

Plug 'kshenoy/vim-signature'               " Show marks in the gutter

Plug 'simnalamburt/vim-mundo'              " Undo tree
nnoremap <F6> :MundoToggle<CR>

Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>m <Plug>(git-messenger)

Plug 'luochen1990/rainbow'                 " Highlight nested braces differently
let g:rainbow_active=1

Plug 'lifepillar/vim-gruvbox8'
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1

Plug 'Yggdroot/indentLine'                 " Highlight indents
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor = &concealcursor

" Filetype Support
Plug 'sheerun/vim-polyglot'
Plug 'direnv/direnv.vim'

Plug 'tmux-plugins/vim-tmux-focus-events'  " tmux helper
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

Plug 'Raimondi/delimitMate'

Plug 'haya14busa/incsearch.vim'
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
let g:clap_provider_grep_opts='-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
map <Leader>o :Clap! files<CR>
map ; :Clap! buffers<CR>
map <Leader>gf :Clap! grep<CR>

autocmd FileType clap_input call s:clap_mappings()
function! s:clap_mappings()
	nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
	nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
endfunction

function! s:ensure_closed() abort
  call clap#floating_win#close()
  silent! autocmd! ClapEnsureAllClosed
endfunction

function! MyClapOnEnter() abort
  augroup ClapEnsureAllClosed
    autocmd!
    autocmd BufEnter,WinEnter,WinLeave * call s:ensure_closed()
  augroup END
endfunction

autocmd User ClapOnEnter call MyClapOnEnter()

Plug 'justinmk/vim-sneak'
let g:sneak#streak=1

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'pbrisbin/vim-restore-cursor'         " Restore cursor to its original position

Plug 'roxma/vim-paste-easy'                " Set and unset paste
let g:paste_char_threshold = 8

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-sleuth'                    " Automatically set tabwidth based on file
Plug 'machakann/vim-sandwich'

" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"
" let g:coc_global_extensions = [
" \ 'coc-snippets',
" \ 'coc-json',
" \ 'coc-python',
" \ 'coc-html',
" \ 'coc-css',
" \ 'coc-yaml',
" \ 'coc-rust-analyzer',
" \ 'coc-docker',
" \ 'coc-sh',
" \ ]
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <silent><expr> <S-TAB>
"     \ pumvisible() ? "\<C-p>" :
"     \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
"     \ "\<C-h>"
"
" let g:coc_snippet_next = '<tab>'
"
" nmap <silent> <Leader>p <Plug>(coc-diagnostic-prev)
" nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)
"
" nmap <Leader>if :call CocAction('format')<cr>
" nmap <Leader>ii :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
" nmap <leader>ic  <Plug>(coc-codeaction)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Use K for show documentation in preview window
" nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>
"
" nnoremap <expr><M-j> coc#util#has_float() ? coc#util#float_scroll(1) : "\<M-j>"
" nnoremap <expr><M-k> coc#util#has_float() ? coc#util#float_scroll(0) : "\<M-k>"
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

Plug 'voldikss/vim-floaterm'
nmap <silent> <Leader>fp :FloatermNew ptpython<cr>
nmap <silent> <Leader>fn :FloatermNew<cr>
nmap <silent> <Leader>ff :Clap floaterm<cr>
tnoremap <silent> fd <C-\><C-n>:q<cr>

noremap  <silent> <Leader>fj :FloatermToggle<CR>
tnoremap  <silent> fj <C-\><C-n>:FloatermToggle<CR>

augroup MyTermMappings
  autocmd!
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>, <C-\><C-n>:FloatermPrev<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>. <C-\><C-n>:FloatermNext<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>q <C-\><C-n>:FloatermToggle<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fd <C-\><C-n>:q<cr>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fj <C-\><C-n>:FloatermToggle<CR>

  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fm <C-\><C-n>:FloatermUpdate height=1.0 width=1.0 pos='center'<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fn <C-\><C-n>:FloatermUpdate height=0.8 width=0.8 pos='center'<CR>
augroup END

nmap <Leader>ft yy:FloatermToggle<CR><C-\><C-n>pi<CR>
vmap <Leader>ft y:FloatermToggle<CR><C-\><C-n>pi<CR>

let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
autocmd User Startified setlocal buflisted

let g:vimwiki_map_prefix = '<leader>v'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
Plug 'vimwiki/vimwiki'

Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'vigoux/completion-treesitter'
Plug 'haorenW1025/diagnostic-nvim'
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-k>"

Plug 'dense-analysis/ale'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 500
let g:gitgutter_highlight_linenrs = 1
nmap <leader>hp <Plug>(GitGutterPrevHunk)
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight link GitGutterAddLineNr GitGutterAdd
highlight link GitGutterChangeLineNr GitGutterChange
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete

call plug#end()

filetype plugin indent on
syntax on

runtime macros/sandwich/keymap/surround.vim
lua require'lsp'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> <Leader>p :PrevDiagnostic<CR>
nmap <silent> <Leader>n :NextDiagnostic<CR>

" Auto close popup menu when finish completion
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'
