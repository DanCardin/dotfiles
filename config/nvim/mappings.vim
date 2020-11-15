" Sudo save
command! W w !sudo tee % > /dev/null

" Window split settings
highlight TermCursor ctermfg=red guifg=red

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


" BufMode
if !hasmapto('<Plug>BufmodeEnter')
	silent! nmap <unique> <leader><Tab> <Plug>BufmodeEnter
endif

nnoremap <unique> <silent> <script> <Plug>BufmodeEnter <SID>BufmodeEnter
nnoremap <SID>BufmodeEnter :<C-u>lua require('self.bufmode').enter()<CR>

if !exists(':BufmodeEnter')
	command! BufmodeEnter :call <Plug>BufmodeEnter
endif

" GitMode
if !hasmapto('<Plug>GitmodeEnter')
	silent! nmap <unique> <leader>gg <Plug>GitmodeEnter
endif

nnoremap <unique> <silent> <script> <Plug>GitmodeEnter <SID>GitmodeEnter
nnoremap <SID>GitmodeEnter :<C-u>lua require('self.gitmode').enter()<CR>

if !exists(':GitmodeEnter')
	command! GitmodeEnter :call <Plug>GitmodeEnter
endif

" DebugMode
if !hasmapto('<Plug>DebugmodeEnter')
	silent! nmap <unique> <leader>db <Plug>DebugmodeEnter
endif

nnoremap <unique> <silent> <script> <Plug>DebugmodeEnter <SID>DebugmodeEnter
nnoremap <SID>DebugmodeEnter :<C-u>lua require('self.debugmode').enter()<CR>

if !exists(':DebugmodeEnter')
	command! DebugmodeEnter :call <Plug>DebugmodeEnter
endif
