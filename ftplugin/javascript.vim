setlocal makeprg=jslint\ %\ --gp\ --devel\ --indent=2
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q

nmap ,jl :w<CR>:make<CR>:cw<CR>
