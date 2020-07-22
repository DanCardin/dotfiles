" middle-click paste
noremap! <s-insert> <middlemouse>
" No Ex mode
nnoremap Q <nop>
" Half page up
nnoremap K <C-U>
" Half page down
nnoremap J <C-D>
" Move to beginning of line
nnoremap B ^
" Move to end of line
nnoremap E $
" Copy to clipboard
nmap Y "+y
vmap Y "+y
vnoremap <C-c> "*y
imap <C-p> <C-o> "*p

" Sets // to search for the visually selected text
vnoremap // y/<C-R>"<CR>

" Start a command
map <Leader>; :
" Quick save
map <Leader>w :w!<cr>
" Quickly close files
map <Leader>q :Sayonara!<cr>
" Open a terminal
map <Leader>tn :term<cr>
" Quick previous tab
map <Leader>, :bprev<cr>
" Quick next tab
map <Leader>. :bnext<cr>
" Horizontal buffers
map <Leader>\h :sp<cr>
" Vertical buffers
map <Leader>\v :vs<cr>
" Force update the current file
map <Leader>e :e!<cr>
" Write the selected text out to less
vmap <Leader>z :write !less<cr>
" Sudo save
command! W w !sudo tee % > /dev/null

" Window split settings
highlight TermCursor ctermfg=red guifg=red

" Terminal settings
tnoremap ;<ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

command Wq wq
command Q q

if !exists("*DeleteHiddenBuffers") " Clear all hidden buffers when running
	function DeleteHiddenBuffers() " Vim with the 'hidden' option
		let tpbl=[]
		call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
		for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
			silent execute 'bwipeout' buf
		endfor
	endfunction
endif
command! DeleteHiddenBuffers call DeleteHiddenBuffers()

map <Leader>Q :DeleteHiddenBuffers<cr>

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


if !hasmapto('<Plug>BufmodeEnter')
	silent! nmap <unique> <leader><Tab> <Plug>BufmodeEnter
endif

nnoremap <unique> <silent> <script> <Plug>BufmodeEnter <SID>BufmodeEnter
nnoremap <SID>BufmodeEnter :<C-u>lua require('bufmode').enter()<CR>

if !exists(':BufmodeEnter')
	command! BufmodeEnter :call <Plug>BufmodeEnter
endif

if !hasmapto('<Plug>GitmodeEnter')
	silent! nmap <unique> <leader>h <Plug>GitmodeEnter
endif

nnoremap <unique> <silent> <script> <Plug>GitmodeEnter <SID>GitmodeEnter
nnoremap <SID>GitmodeEnter :<C-u>lua require('gitmode').enter()<CR>

if !exists(':GitmodeEnter')
	command! GitmodeEnter :call <Plug>GitmodeEnter
endif
