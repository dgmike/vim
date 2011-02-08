syntax on
set nocompatible
set visualbell
set nu
set bg=dark
set st=4 ts=4 sts=4 sw=4 et sta " tabstop, tabsize, softtabstop, shiftwidth, expandtab
set nowb nobk
set showcmd
set showmode
set cf
set ruler
set laststatus=2
set is
set sm
set scrolloff=2
set sc
set wildmenu                                                                            " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest                                                               " make cmdline tab completion similar to bash
set wildignore+=*.o,*~,.lo,*.swp,*.pyc,*.pyo,*.dll,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png  " stuff to ignore when tab completing
set joinspaces
filetype indent on
set modeline
set clipboard+=unnamed
set ai si
set hls ci
set mouse=a

" set gfn=Monaco\ 9
" color Mustang_Vim_Colorscheme_by_hcalves

" Use filetype plugins, e.g. for PHP
filetype plugin on
filetype indent on

if (has("gui_running"))
	set gfn=Monaco\ 9
	color chocolate
	set guioptions-=r
	set guioptions-=l
	set guioptions-=m
	set guioptions-=T
else
    let &t_Co=256
    color ir_black
end

if has("colorcolumn")
    set colorcolumn=80
else
    " au BufWinEnter * let w:m2=matchadd('ErrorMsg', '', -1)
    " au BufWinEnter *.php let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    " au BufEnter *.php let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

imap "<Tab> ""<Left>
imap '<Tab> ''<Left>
imap (<Tab> (  )<Left><Left>
imap [<Tab> []<Left>
imap ("<Tab> (<Tab>"<Tab>
imap ["<Tab> [<Tab>"<Tab>
imap ('<Tab> (<Tab>'<Tab>
imap ['<Tab> [<Tab>'<Tab>

imap ';<Tab> '';<Left><Left>
imap ";<Tab> "";<Left><Left>

imap (;<Tab> (  );<Left><Left><Left>
imap (';<Tab> ( '' );<Left><Left><Left><Left><Left>
imap [';<Tab> [''];<Left><Left><Left>

imap ><Tab> ></><Esc>?<[a-zA-Z]<Cr><F4>lviwy/<\/><Cr><F4>lpF<i
imap ><s-Tab> ><Tab>

map <F4> :noh<Cr>

" Troca o template para facilitar a leitura em alguns casos

function! ToggleTemplate()
    if &background == 'dark'
        color symfony
    else
        color ir_black
    endif
endfunction

map <F8> :call ToggleTemplate()<CR>

" Mapeamento

nmap <A-left>  :tabprev<Cr>
nmap <A-right> :tabnext<Cr>
nmap <A-Up> :ls<Cr>

map <F9> :source ~/.vimrc<Cr>:echo ".vimrc recarregado!"<Cr>
map <S-F9> :tabnew ~/.vimrc<Cr>

map <c-d> yyp

cab tn tabnew
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab X x

" ======================== PHP ==========================
imap {<Tab> {}<left>
imap {<Cr> {<Esc>o}<Esc>O
imap pfn<Tab> public fn<Tab>
imap prfn<Tab> private fn<Tab>_
imap fore<Tab> foreach ($ as $item) {<Cr><Esc>k0f$a
imap forek<Tab> foreach ($ as $key => $value) {<Cr><Esc>k0f$a
imap ?fore<Tab> <?php foreach ($ as $item): ?><Cr><?php endforeach; ?><Esc>O<Esc>k$2F$a
imap c<Tab> class <Cr>{<Cr><Esc>2kA
imap ?<Tab> <?php  ?><Esc>F i
imap ??<Tab> <?php<Cr><Cr>
imap ?=<Tab> <?php echo ; ?><Esc>F;i
imap =<Tab> <?php echo ; ?><Esc>F;i
imap '=<Tab> '' => '',<Esc>7hi
imap '==<Tab> '' => ''<Esc>7hi

"let php_sql_query=1
"let php_htmlInStrings=1
let php_noShortTags=1
" let php_folding=1

" Arrays
imap ar<Tab> array(<Tab>
imap ar;<Tab> array(;<Tab>
imap ar'<Tab> array('<Tab>
imap ar';<Tab> array(';<Tab>
imap ar=<Tab> ar<Tab>'==<Tab>
imap ar=;<Tab> ar;<Tab>'==<Tab>

imap pprint<Tab> print '<pre class="debug" style="text-align:left;">'.print_r($, true)."</pre>";<Esc>F$a
imap deb<Tab> <Esc>:call Dg_debug()<CR>

function! Dg_debug()
    let dg_v_debug=input('Variavel: ')
    exe "normal iprint '<pre style=\\\'border:1px solid silver;padding:5px;overflow:auto;\\\'>';"
    exe "normal oprint '<strong>File:</strong> '.__FILE__.PHP_EOL;"
    exe "normal oprint '<strong>Line:</strong> '.__LINE__.PHP_EOL;"
    exe "normal oprint '<strong>Variable:</strong> "
    exe "normal i" dg_v_debug
    exe "normal A';"
    exe "normal oprint '<hr />';"
    exe "normal oprint_r ("
    exe "normal A" dg_v_debug
    exe "normal A );"
    exe "normal oprint '</pre>';"
endfunction

" Smaty
imap %<Tab> <%  %><Left><Left><Left>
imap %%<Tab> <% php %><% /php %><esc>F<i
imap %i<Tab> <% if %><% /if %><esc>F<F%i
imap %*<Tab> <%*  *%><Left><Left><Left><Left>

" phpdoc
map ,pu :!phpunit %<Cr>
map ,pd :call PhpDoc()<Cr>
imap ,pd <Esc>,pd

" Maps para Comandos
nmap <C-S-P> :!reset && php %<Cr>
nmap ,c :!phpcs %<Cr>
nmap ,a :!svn add %<Cr>
nmap ,dc :!svn ci % -m ""<Left>
nmap ,df :!svn diff %<Cr>
nmap <C-F11> :lvimgrep /function /%<Cr>:lw<Cr>

" dos2,nix
nmap ,unix   :%s/\r$//     <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap loren<Tab> Lorem ipsum dolor sit amet, consectetur
  \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
  \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
  \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
  \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
  \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
  \ proident, sunt in culpa qui officia deserunt mollit anim id est
  \ laborum.

imap lipsum<tab> loren<Tab>

imap ice<Tab> ??<Tab>include ';<Tab>ice/app.php<Esc>oinclude ';<Tab>
  \controller.php<Esc>oinclude ';<Tab>model.php<Esc>o<Esc>oapp(;<Tab>
  \ar<Tab><Cr><Esc>O'=<Tab>^/?$<Esc>2f'aHome<Esc>j==kk

" AutoCommands
au BufRead,BufNewFile *.smarty set filetype=smarty
au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

au BufEnter * set ai
au BufEnter *.js imap fn<Tab> function (){}<Esc>Fna

au BufEnter *.js imap $<Tab> $('<Tab>
au BufLeave *.js iunmap $<Tab>
au BufEnter *.js imap $;<Tab> $(';<Tab>
au BufLeave *.js iunmap $;<Tab>

au BufEnter *.php imap fn<Tab> function ()<CR>{<Cr><Esc>2k$hi
au BufRead,BufNewFile *.php     set indentexpr= | set smartindent
autocmd BufWinLeave * call clearmatches()

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead *access.log* setf httplog

" Highlight current line in insert mode.
" autocmd InsertLeave * set nocul
" autocmd InsertEnter * set cul

" Set tab size on your file
imap ts<Tab> /* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

" CTRL + X O
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Easy set tab size
function! SetTab(spaces)
  let spaces = a:spaces
  if a:spaces > 0
    echo a:spaces
    execute 'set tabstop='.spaces
    execute 'set shiftwidth='.spaces
    execute 'set expandtab'
  else
    set tabstop=4
    set shiftwidth=4
    set noexpandtab
    set listchars=tab:¬\ ,trail:-
    set list
  endif
endfunction

command! -nargs=? ST :call SetTab(<f-args>)

" Chamando as Tags

let Tlist_Auto_Open = 0 " Automatically open the taglist window on Vim startup
let Tlist_GainFocus_On_ToggleOpen = 1 " When the taglist window is toggle opened, move the cursor to the taglist window
let Tlist_Process_File_Always = 0 " Process files even when the taglist window is not open
let Tlist_Show_Menu = 1
let Tlist_Sort_Type = 'order' " Tag listing sort type - 'name' or 'order'
let Tlist_Use_Right_Window = 1 " Tag listing window split (horizontal/vertical) control
let Tlist_Display_Prototype = 0 " Display tag prototypes or tag names in the taglist window
let Tlist_Display_Tag_Scope = 0 " Display tag scopes in the taglist window
let Tlist_Use_SingleClick = 0 " Use single left mouse click to jump to a tag. By default this is disabled.
                              " Only double click using the mouse will be processed.
let Tlist_Compact_Format = 1 " Control whether additional help is displayed as part of the taglist or
                             " not.  Also, controls whether empty lines are used to separate the tag tree.
let Tlist_Exit_OnlyWindow = 1 " Exit Vim if only the taglist window is currently open. By default, this is set to zero.
let Tlist_File_Fold_Auto_Close = 1 " Automatically close the folds for the non-active files in the taglist window
let Tlist_Close_On_Select = 1 " Close the taglist window when a tag is selected
let Tlist_Auto_Update = 1 " Automatically update the taglist window to display tags for newly edited files
let Tlist_Auto_Highlight_Tag = 1 " Automatically highlight the current tag
let Tlist_Highlight_Tag_On_BufEnter = 1 " Automatically highlight the current tag on entering a buffer
let Tlist_Enable_Fold_Column = 1 " Enable fold column to display the folding for the tag tree
let Tlist_Show_One_File = 1 " Display the tags for only one file in the taglist window

map <F6> :TlistToggle<CR>

" integrando o codesniffer ao VIM
" set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"\\,%*[a-zA-Z0-9_.-]
"
" function! RunPhpcs()
"     let l:quote_token="'"
"     let l:filename=@%
"     let l:phpcs_output=system('phpcs --report=csv '.l:filename)
"     let l:phpcs_output=substitute(l:phpcs_output, '\\"', l:quote_token, 'g')
"     let l:phpcs_list=split(l:phpcs_output, "\n")
"     unlet l:phpcs_list[0]
"     cexpr l:phpcs_list
"     copen
" endfunction
" command! Phpcs execute RunPhpcs()

" {{{ Alignment

func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
        " Skip comment lines
        if getline (l:line) =~ '^\s*\/\/.*$'
            let l:line = l:line + 1
            continue
        endif
        " \{-\} matches ungreed *
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\S\{0,1}=\S\{0,1\}\s.*$', '\1', "")
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile

    let l:line = a:firstline
    let l:format = "%s%-" . l:maxlength . "s %s %s"

    while l:line <= l:endline
        if getline (l:line) =~ '^\s*\/\/.*$'
            let l:line = l:line + 1
            continue
        endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\2', "")
        let l:linevalue = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\3', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc

vnoremap <buffer> <C-a> :call PhpAlign()<CR>

""
"" list chars
""
" set list listchars=tab:>\ ,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
" set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
command! LC set list! listchars=tab:»\ ,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
" set list listchars=tab:>-,eol:¶
" The command :dig displays other digraphs you can use.

au BufRead,BufNewFile /etc/nginx/sites-avaliable/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-enabled/* set ft=nginx

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

let b:PHP_autoformatcomment = 0

source $HOME/.vim/ftplugin/sparkup.vim
source $HOME/.vim/plugin/taglist.vim
