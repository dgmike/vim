" Prevent load
if exists("dgmike_project_loader")
    finish
endif
let g:dgmike_project_loader=1

let s:project_file = expand("$HOME/.vim_projects.vim")

if filereadable(s:project_file) != -1
    exec 'source '.s:project_file
endif

