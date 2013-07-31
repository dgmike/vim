:set t_Co=16

:filetype plugin on
:filetype indent on

:execute pathogen#infect()
:runtime! dgmike/*.vim
:set runtimepath+=~/.vim/dgmike
