function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=emacs '.l:filename)
    " DEBUG
    " echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

set errorformat=%f:%l:%c:\ %t%*[^-]-\ %m
command! Phpcs execute RunPhpcs()

nmap ,pcs :Phpcs<CR>
nmap ,n :cnext<CR>
nmap ,N :cprevious<CR>
