syntax on
set nocompatible
set visualbell
set nu bg=dark
set st=4 ts=4 sts=4 sw=4 et sta " tabstop, 
set nowb nobk
set showcmd
set showmode
set cf
set ruler
set laststatus=2
set is
set sc
set wildmenu                                                                            " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest                                                               " make cmdline tab completion similar to bash
set wildignore+=*.o,*~,.lo,*.swp,*.pyc,*.pyo,*.dll,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png  " stuff to ignore when tab completing
set joinspaces

set clipboard+=unnamed
set ai si
set hls ci
set mouse=a

if (has("gui_running"))
	set gfn=Monaco\ 8
	color chocolate
else
    let &t_Co=256
    color ir_black
end

if has("colorcolumn")
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

imap "<Tab> ""<Left>
imap '<Tab> ''<Left>
imap (<Tab> ()<Left>
imap [<Tab> []<Left>
imap ("<Tab> (<Tab>"<Tab>
imap ["<Tab> [<Tab>"<Tab>
imap ('<Tab> (<Tab>'<Tab>
imap ['<Tab> [<Tab>'<Tab>

imap ';<Tab> '';<Left><Left>
imap ";<Tab> "";<Left><Left>

imap (;<Tab> ();<Left><Left>
imap (';<Tab> ('');<Left><Left><Left>
imap [';<Tab> [''];<Left><Left><Left>

imap ><Tab> ></><Esc>?<[a-zA-Z]<Cr><F4>lviwy/<\/><Cr><F4>lpF<i
imap ><s-Tab> ><Tab>

map <F4> :noh<Cr>

map <A-left>  :tabprev<Cr>
map <A-right> :tabnext<Cr>
map <A-Up> :ls<Cr>

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
imap fore<Tab> foreach ($ as $item) {<Cr><Esc>k0f$a
imap ?fore<Tab> <?php foreach ($ as $item): ?><Cr><?php endforeach; ?><Esc>O<Esc>k$2F$a
imap c<Tab> class <Cr>{<Cr><Esc>2kA
imap ?<Tab> <?php  ?><Esc>F i
imap ??<Tab> <?php<Cr><Cr>
imap ?=<Tab> <?php echo ; ?><Esc>F;i
imap =<Tab> <?php echo ; ?><Esc>F;i
imap '=<Tab> '' => '',<Esc>7hi

" Arrays
imap ar<Tab> array(<Tab>
imap ar;<Tab> array(;<Tab>
imap ar'<Tab> array('<Tab>
imap ar';<Tab> array(';<Tab>

imap pprint<Tab> print '<pre class="debug" style="text-align:left;">'.print_r($, true)."</pre>";<Esc>F$a

" Smaty
imap %<Tab> <%%><Esc>F%i
imap %%<Tab> <%php%><%/php%><esc>F<i
imap %i<Tab> <%if %><%/if%><esc>F<F%i

" phpdoc
map ,pd :call PhpDoc()<Cr>
imap ,pd <Esc>,pd

" Maps para Comandos
nmap ,p :!reset && php %<Cr>
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

imap ice<Tab> ??<Tab>include ';<Tab>ice/app.php<Esc>oinclude ';<Tab>
  \controller.php<Esc>oinclude ';<Tab>model.php<Esc>o<Esc>oapp(;<Tab>
  \ar<Tab><Cr><Esc>O'=<Tab>^/?$<Esc>2f'aHome<Esc>j==kk

" AutoCommands
au BufEnter * set ai
au BufEnter *.js imap fn<Tab> function (){}<Esc>Fna
au BufEnter *.php imap fn<Tab> function ()<CR>{<Cr><Esc>2k$hi

" Set tab size on your file
imap ts<Tab> /* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

au FileType php set omnifunc=phpcomplete#CompletePHP
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

" habilitando ftplugin de sparkup
source $HOME/.vim/ftplugin/sparkup.vim
