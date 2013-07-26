" function to change the color of comments
:function! <SID>ChangeCommentColors()
  :if s:CommentColor == "dark"
    :let s:CommentColor = "light"
    :hi Comment ctermfg=darkgray
  :else
    :let s:CommentColor = "dark"
    :hi Comment ctermfg=gray
  :endif
:endfunction

:map <F2> :call <SID>ChangeCommentColors()<CR>

" initial trigger
:let s:CommentColor = "light"
:call <SID>ChangeCommentColors()
