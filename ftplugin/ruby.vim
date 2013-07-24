imap deb<Tab> p "*" * 60<Esc>"lyy"lpOp 
imap do<Tab>  do \|\|<CR>end<Esc>k$i
imap def<Tab> def <CR>end<Esc>kA

nmap <C-F11> :lvimgrep /\s*def\\|task/%<Cr>:lw<Cr>
