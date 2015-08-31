let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /usr/local/insightsquared/is_engine
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +8 /usr/local/insightsquared/is_engine
badd +97 bbase/htdocs/js/modules/chart.js
badd +268 bbase/htdocs/js/modules/compare_mode.coffee
badd +80 bbase/main/templates/readyjs/chart.js
badd +813 bbase/utils/is_charter/ischart.py
badd +1081 bbase/utils/is_charter/isqueryset.py
badd +1 bbase/utils/is_charter/iscolumns.py
badd +1 bbase/htdocs/js/lib/is_compare.coffee
badd +1 tests/bbase/utils/screen_utils/__init__.py
badd +1 bbase/utils/screen_utils/__init__.py
badd +1 bbase/utils/is_charter/base.py
badd +1 bbase/main/templates/base_mobile.html
badd +368 bbase/main/templates/mobile/content.html
badd +20 bbase/main/templates/ISTableChart/sidebyside_template.html
badd +1 mobile/www/css/styles.css
badd +797 mobile/www/js/mobile.js
badd +8 bbase/main/templates/add_to_dash.html
badd +1 bbase/htdocs/js/lib/is_add.coffee
badd +1 bbase/htdocs/js/modules/uber_dash.coffee
badd +1 bbase/main/dashboard_settings.py
badd +1 bbase/htdocs/mobile_archive/1.1.0/js/mobile.js
badd +194 bbase/utils/is_charter/istablechart.py
badd +2 bbase/main/templates/readyjs/ISTableChart.js
badd +1 bbase/main/templates/readyjs/summary.js
badd +1 bbase/main/templates/ISChart/chart.html
badd +1 bbase/htdocs/js/components/dashboard_library.coffee
badd +1 bbase/isconfig/models.py
badd +1 bbase/isconfig/templates/ISConfig/widgets.html
badd +0 mobile/www/index.html
badd +0 mobile/www/spec.html
badd +0 mobile/www/js/uimobile.js
badd +0 bbase/main/templates/ui2015/content/report.html
badd +34 bbase/main/templates/mobile/mobile_menu.html
badd +0 bbase/htdocs/js/lib/highcharts-pattern-fill.js
badd +0 bbase/main/templates/base_sans_nav.html
badd +0 bbase/main/templates/base_template.html
argglobal
silent! argdel *
argadd /usr/local/insightsquared/is_engine
set stal=2
edit bbase/utils/is_charter/ischart.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
896
normal! zo
902
normal! zo
903
normal! zo
let s:l = 933 - ((16 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
933
normal! 035|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/mobile/www/js/mobile.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 37 - ((20 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
37
normal! 08|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/mobile/www/index.html
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 24 - ((23 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 041|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/bbase/main/templates/mobile/content.html
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 360 - ((13 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
360
normal! 05|
tabedit /usr/local/insightsquared/is_engine/bbase/htdocs/js/lib/highcharts-pattern-fill.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 21 - ((20 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 030|
tabedit /usr/local/insightsquared/is_engine/bbase/main/templates/ui2015/content/report.html
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 46 - ((35 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 037|
tabedit /usr/local/insightsquared/is_engine/bbase/htdocs/js/modules/compare_mode.coffee
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 73 - ((9 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
73
normal! 0
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/bbase/htdocs/js/modules/uber_dash.coffee
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 715 - ((27 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
715
normal! 017|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/bbase/main/dashboard_settings.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
664
normal! zo
let s:l = 709 - ((36 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
709
normal! 05|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/bbase/htdocs/js/lib/is_add.coffee
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
111
normal! zo
150
normal! zo
152
normal! zo
170
normal! zo
191
normal! zo
201
normal! zo
270
normal! zo
297
normal! zo
let s:l = 296 - ((28 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
296
normal! 019|
lcd /usr/local/insightsquared/is_engine
tabedit /usr/local/insightsquared/is_engine/bbase/utils/is_charter/isqueryset.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
980
normal! zo
986
normal! zo
1188
normal! zo
1197
normal! zo
1198
normal! zo
1215
normal! zo
1216
normal! zo
1218
normal! zo
1228
normal! zo
1242
normal! zo
1255
normal! zo
1276
normal! zo
1283
normal! zo
1292
normal! zo
1324
normal! zo
1337
normal! zo
1404
normal! zo
1486
normal! zo
1492
normal! zo
1493
normal! zo
1498
normal! zo
1506
normal! zo
1512
normal! zo
1532
normal! zo
1568
normal! zo
1574
normal! zo
1585
normal! zo
1607
normal! zo
1640
normal! zo
1642
normal! zo
1643
normal! zo
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 013|
lcd /usr/local/insightsquared/is_engine
tabnext 2
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
