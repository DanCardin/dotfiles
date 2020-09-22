function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:python_host_prog = $HOME . '/.nix-profile/bin/nvim-python3'
let g:python3_host_prog = $HOME . '/.nix-profile/bin/nvim-python3'

function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('lifepillar/vim-gruvbox8')

  call packager#add('vimwiki/vimwiki', { 'type': 'opt' })
  call packager#add('simnalamburt/vim-mundo', { 'type': 'opt' })

  " Visual Additions
  call packager#add('rhysd/git-messenger.vim')
  call packager#add('luochen1990/rainbow') " Highlight nested braces differently
  call packager#add('Yggdroot/indentLine') " Highlight indents
  call packager#add('APZelos/blamer.nvim')
  " call packager#add('nvim-treesitter/nvim-treesitter')
  call packager#add('danilamihailov/beacon.nvim')
  call packager#add('rhysd/clever-f.vim')
  call packager#add('nvim-lua/lsp-status.nvim')
  call packager#add('tjdevries/lsp_extensions.nvim')
  call packager#add('Xuyuanp/scrollbar.nvim')
  call packager#add('RishabhRD/popfix')
  call packager#add('RishabhRD/nvim-lsputils')

  " Tmux
  call packager#add('tmux-plugins/vim-tmux-focus-events')
  call packager#add('RyanMillerC/better-vim-tmux-resizer')
  call packager#add('christoomey/vim-tmux-navigator')

  " Other
  call packager#add('Iron-E/nvim-libmodal')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('direnv/direnv.vim')
  call packager#add('vim-test/vim-test')
  call packager#add('tpope/vim-dispatch')

  call packager#add('Raimondi/delimitMate')
  call packager#add('haya14busa/incsearch.vim')
  call packager#add('liuchengxu/vim-clap', { 'do': ':Clap install-binary!' })
  " call packager#add('nvim-lua/popup.nvim')
  " call packager#add('nvim-lua/plenary.nvim')
  " call packager#add('nvim-lua/telescope.nvim')

  call packager#add('justinmk/vim-sneak')
  call packager#add('mhinz/vim-sayonara', { 'on': 'Sayonara' })
  call packager#add('pbrisbin/vim-restore-cursor')
  call packager#add('roxma/vim-paste-easy') " Set and unset paste
  call packager#add('tomtom/tcomment_vim')
  call packager#add('pope/vim-repeat')
  call packager#add('zsugabubus/crazy8.nvim') " Automatically set tabwidth based on file
  call packager#add('liuchengxu/vista.vim', { 'type': 'opt' })
  call packager#add('machakann/vim-sandwich')
  call packager#add('voldikss/vim-floaterm')

  call packager#add('ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' })
  call packager#add('neovim/nvim-lsp')
  call packager#add('hrsh7th/vim-vsnip')
  call packager#add('hrsh7th/vim-vsnip-integ')
  call packager#add('haorenW1025/completion-nvim')
  call packager#add('haorenW1025/diagnostic-nvim')
  " call packager#add('vigoux/completion-treesitter')
  call packager#add('steelsojka/completion-buffers')
  call packager#add('dense-analysis/ale')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('tpope/vim-dotenv')
endfunction

command! PlugInstall call PackagerInit() | call packager#install()
command! -bang PlugUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PlugClean call PackagerInit() | call packager#clean()
command! PlugStatus call PackagerInit() | call packager#status()

autocmd VimEnter * call s:setup()

function! s:setup() abort
  runtime macros/sandwich/keymap/surround.vim
  execute BlamerToggle()

  lua require'lsp'
  " lua require'treesitter'
  lua require'bufmode'
  lua require'gitmode'

  autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
	\ :lua require'lsp_extensions'.inlay_hints{
	\   prefix = ' » ',
    \   aligned = true,
    \   highlight = "NonText"
	\ }
endfunction

" vim-mundo
nnoremap <F6> :packadd vim-mundo<BAR>MundoToggle<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_map_prefix = '<leader>v'
nnoremap <silent><Leader>v :unmap <Leader>v<BAR>packadd vimwiki<BAR>VimwikiIndex<CR>

" rhysd/git-messenger.vim
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>m <Plug>(git-messenger)

" luochen1990/rainbow
let g:rainbow_active=1

" lifupillar/vim-gruvbox8
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1

" Yggdroot/indentLine
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor = &concealcursor

" APZelos/blamer.nvim
let g:blamer_enabled = 0
let g:blamer_show_in_visual_modes = 0

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" haya14busa/incsearch.vim
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" liuchengxu/vim-clap
let g:clap_provider_grep_opts='-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
map <Leader>o :Clap! files ++finder=rg --files<CR>
map ; :Clap! buffers<CR>
map <Leader>gf :Clap! grep<CR>

" nnoremap <Leader>o :lua require'telescope.builtin'.git_files{}<CR>
" map ; :lua require'telescope.builtin'.buffers{}<CR>
" nnoremap <Leader>gf :lua require'telescope.builtin'.live_grep{}<CR>

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

" justinmk/vim-sneak
let g:sneak#streak=1

" roxma/vim-paste-easy
let g:paste_char_threshold = 8

" liuchengxu/vista.vim
nnoremap <silent><Leader>v :unmap <Leader>v<BAR>packadd vimwiki<BAR>VimwikiIndex<CR>
map <C-s> :packadd vista<BAR>Vista!!<CR>

" machakann/vim-sandwich

" voldikss/vim-floaterm
nmap <silent> <Leader>fp :FloatermNew ptpython<cr>
nmap <silent> <Leader>fn :FloatermNew<cr>
nmap <silent> <Leader>ff :Clap floaterm<cr>

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

" ripxorip/aerojump.nvim
nmap <Leader>aj <Plug>(AerojumpBolt)

" hrsh7th/vim-vsnip
let g:vsnip_snippet_dir='~/.config/nvim/vsnip'
imap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" haorenW1025/completion-nvim
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_ignore_case = 1
let g:completion_trigger_on_delete = 1
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
      \ 'default': [
      \    {'complete_items': ['lsp', 'snippet', 'path']},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \  ]}

" haorenW1025/diagnostic-nvim
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1
let g:diagnostic_show_sign = 1

" dense-analysis/ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

" airblade/vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 500
let g:gitgutter_highlight_linenrs = 1
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight link GitGutterAddLineNr GitGutterAdd
highlight link GitGutterChangeLineNr GitGutterChange
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

nmap <silent> <Leader>p :PrevDiagnostic<CR>
nmap <silent> <Leader>n :NextDiagnostic<CR>

" Auto close popup menu when finish completion
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

filetype plugin indent on
syntax on
