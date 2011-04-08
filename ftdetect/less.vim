" Vim filetype detection file
" Language:	Less.js
" Maintainer:	Michael Granados <michaelgranados@gmail.com>
" URL:		http://lessjs.org
" Version:	1
" Last Change:  2011 Mar 20
"
augroup twig
     au! BufRead,BufNewFile *.less   setfiletype less
augroup END

