let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/program/react/RaptorsBlog
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 content/pages/about/index.mdx
badd +5 content/pages/new/new.mdx
badd +83 gatsby-config.js
badd +98 content/posts/fantastic-beasts-and-where-to-find-them/index.mdx
badd +10 content/posts/lexical-analyser/index.mdx
badd +187 content/posts/pass1-of-a-2pass-assembler/index.mdx
badd +1 content/posts/pass1-of-a-2pass-assembler/style.css
badd +1 content/posts/lexical-analyser/style.css
badd +1 content/posts/pass2-of-a-2pass-assembler/index.mdx
badd +11 src/components/ViewCount.jsx
badd +17 ~/program/react/RaptorsBlog/makePost.sh
argglobal
%argdel
edit ~/program/react/RaptorsBlog/makePost.sh
argglobal
balt content/posts/pass2-of-a-2pass-assembler/index.mdx
let s:l = 17 - ((16 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 024|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
