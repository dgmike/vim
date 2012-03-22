" if (exists("g:loaded_sendmail") && g:loaded_sendmail) || &cp
"         finish
" endif
" 
" let g:loaded_sendmail = 1
" 
" command! -complete=custom,ListAddresses -nargs=1 Email exec('py sendmail_email("<args>")')
" 
" fun ListAddresses(A,L,P)
"     return system("(grep -o '84=[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' ~/.thunderbird/*.default/abook.mab && cat /home/felipe/.vim/plugin/sendmail.addresslist) | sed -s 's/84=//' | sort | uniq -u")
" endfun
" 
" python <<EOF
" import vim
" import smtplib
" from email.mime.text import MIMEText
" 
" def sendmail_email(to_address):
"     smtp_server = vim.eval("g:sendmail_smtpserver")
"     smtp_port = vim.eval("g:sendmail_port")
"     from_address = vim.eval("g:sendmail_email")
"     password = vim.eval("g:sendmail_password")
" 
"     body = "\n".join(vim.current.buffer[2:])
"     msg  = MIMEText(body, _charset='utf-8')
"     msg['Subject'] = vim.current.buffer[0]
"     msg['From'] = from_address
"     msg['To'] = to_address
" 
"     print "connecting..."
"     server = smtplib.SMTP(smtp_server, smtp_port)
"     server.ehlo()
"     server.starttls()
"     server.ehlo()
"     server.login(from_address, password)
"     print 'sending...'
"     server.sendmail(from_address, to_address, msg.as_string())
"     server.quit()
"     print 'Done!'
" EOF
