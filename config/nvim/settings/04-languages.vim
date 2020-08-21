augroup configgroup " {
    au FileType markdown setlocal concealcursor=c
    " au FileType python setlocal commentstring=#\ %s
    " au FileType python setlocal nosmartindent
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END " }

augroup pythonstuff " {
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup END " }

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
