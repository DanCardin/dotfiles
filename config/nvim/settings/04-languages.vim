augroup configgroup " {
    au FileType python setlocal commentstring=#\ %s
    au FileType python setlocal nosmartindent
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END " }
