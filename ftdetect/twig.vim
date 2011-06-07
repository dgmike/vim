" Vim filetype detection file
" Language:	Taskpaper (http://hogbaysoftware.com/projects/taskpaper)
" Maintainer:	David O'Callaghan <david.ocallaghan@cs.tcd.ie>
" URL:		http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Version:	1
" Last Change:  2007 Sep 25
"
augroup twig
     au! BufEnter,BufRead,BufNewFile *.twig   setfiletype htmltwig
augroup END
