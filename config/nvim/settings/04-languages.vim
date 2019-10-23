augroup configgroup " {
    au FileType markdown setlocal concealcursor=c
    au FileType python setlocal commentstring=#\ %s
    au FileType python setlocal nosmartindent
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END " }
