"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Owner:	Vingel - http://www.vingel.com
" Modified: 2010-01-02 18:43:57

" set runtimepath=~/vim,$VIMRUNTIME
" source ~/vim/vimrc

" Get out of VI's compatible mode..
set nocompatible

if v:version < 700
    echoerr 'This vimrc requires Vim 7 or later.'
    finish
endif

if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $VIMRC = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $VIMRC = $HOME.'/.vimrc'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UserInterface Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin indent on
" Set mapleader 
let mapleader = ","
let g:mapleader = ","
" Set 7 lines to the curors - when moving vertical..
set so=7
" Turn on WiLd menu
set wildmenu
set wildmode=longest,full
set wildignore=*.bak,*.o,*.e,*~,*.pyc,*.svn
" Always show current position
set ruler
" The commandbar is 2 high
set cmdheight=2
" Show line number
set number
" Do not redraw, when running macros.. lazyredraw
set lazyredraw
" Change buffer - without saving
set hidden
" Set backspace
set backspace=eol,start,indent
" Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l
"Ignore case when searching
set ignorecase
set incsearch
" Set magic on
set magic
" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=
" Make GUI File Open use current directory
set browsedir=buffer                 
" Show matching bracets
set showmatch
set showfulltag
" How many tenths of a second to blink
set mat=2
" Highlight search things
set hlsearch
" Have the mouse enabled all the time:
set mouse=a
" show incomplete commands
set showcmd 
" Sets how many lines of history VIM har to remember
set history=800
" Always switch to the current file directory
"set autochdir  
"Set the terminal title
set title
" Don't break the words with following character
set iskeyword+=_,$,@,%,#,- et title

" Turn backup off
set nobackup
set nowb
set noswapfile

" Folding settings
set nofoldenable        "dont fold by default
set foldmarker={,}
set foldopen=block,hor,mark,percent,quickfix,tag
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=1         "this is just what i use
map <leader>f1 :set fdm=manual<cr>
map <leader>f2 :set fdm=indent<cr>
map <leader>f3 :set fdm=marker<cr>

" Text options
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set lbr
set tw=500
set isfname-=\= " fix filename completion in VAR=/path

" Don't display start text :help iccf
set shortmess=atI 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select All
map <leader>a ggVG
" BufExplorer
map <leader>b :BufExplorer<cr>
" Switch to current dir, see also :set autochdir
map <leader>cd :cd %:p:h<cr>
" Temp text buffer
map <leader>e :e ~/.buffer<cr>
" Remove the Windows ^M
map <leader>M :%s/\r//g<cr> 
" Fast Quit
map <leader>q :q<cr>
" Fast reloading of the .vimrc
map <leader>s :source $VIMRC<cr>
" Undolist
map <leader>u :undolist<cr>
" Fast saving
map <leader>w :w!<cr>
map <C-S> <Esc>:w!<cr>

" Mapping Q to exit instead of Ex mode
map Q :x<cr>
nmap :X :x
nmap :W :w
nmap :Q :q
" Bash like
imap <C-A> <Home>
imap <C-E> <End>
imap <C-K> <Esc>d$i
imap <C-B> <Left> 
imap <C-F> <Right> 

" Command-line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" Key mappings to ease browsing long lines
noremap <C-J> gj
noremap <C-K> gk

" Usefull when insert a new indent line
imap jj <cr><C-O>O
" Remove tag content see :help object-select
imap ff <C-O>cit

" Move lines (Eclipse like)
nmap <C-Down> :<C-u>move .+1<cr>
nmap <C-Up> :<C-u>move .-2<cr>
imap <C-Down> <C-o>:<C-u>move .+1<cr>
imap <C-Up> <C-o>:<C-u>move .-2<cr>
vmap <C-Down> :move '>+1<cr>gv
vmap <C-Up> :move '<-2<cr>gv

" Windows issues
vmap <leader>c "+y 
vmap <leader>x "+x
map <leader>v "+gP
inoremap <leader>v <C-O>"+gP
" Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
" Set clipboard+=unnamed

" Easily change between backslash and forward slash with f/ or f\
nnoremap <silent> f/ :let tmp=@/<CR>:s:\\:/:ge<CR>:let @/=tmp<CR>
nnoremap <silent> f<Bslash> :let tmp=@/<CR>:s:/:\\:ge<CR>:let @/=tmp<CR>

" Undo
inoremap <C-z> <C-O>u

" Use shell with ctrl-z  
"map <C-Z> :shell<cr>

" Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''
" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>
" SVN Diff
map <F8> :new<cr>:read !svn diff<cr>:set syntax=diff buftype=nofile<cr>gg
" ROT13 
map <F12> ggVGg?

" Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=xhtml<cr>
map <leader>2 :set ft=css<cr>
map <leader>3 :set ft=javascript<cr>
map <leader>4 :set syntax=python<cr>
map <leader>5 :set ft=php<cr>
map <leader>$ :syntax sync fromstart<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Win Alt Key
set winaltkeys=no

" Actually, the tab does not switch buffers, but my arrows
" Use the arrows to something usefull
nmap <C-P> :bp<cr>
nmap <C-N> :bn<cr>
map <C-E> :Bclose<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Tab configuration
map <leader>tn :tabnext<cr>
map <leader>te :tabedit
try
    set switchbuf=usetab
    set stal=2
catch
endtry

" Favorite filetypes
set fileformats=unix,dos,mac

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/Vingel/', "~/", "g")
    return curdir
endfunction

"Format the statusline
set statusline=%F%m%r%h%w\ CW\ %r%{CurDir()}%h\ [%Y,%{&ff},%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ [POS=%l,%v,%p%%,%L] 

""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> # :call VisualSearch('b')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map auto complete of (, ", ', [,{
inoremap ( ()<esc>:let leavechar=")"<cr>i
inoremap [ []<esc>:let leavechar="]"<cr>i
inoremap { {}<esc>:let leavechar="}"<cr>i
inoremap < <><esc>:let leavechar=">"<cr>i
inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i
inoremap )) (<esc>o)<esc>:let leavechar=")"<cr>O
inoremap ]] [<esc>o]<esc>:let leavechar="]"<cr>O
inoremap }} {<esc>o}<esc>:let leavechar="}"<cr>O

vnoremap #( <esc>`>a)<esc>`<i(<esc>
vnoremap #[ <esc>`>a]<esc>`<i[<esc>
vnoremap #{ <esc>`>a}<esc>`<i{<esc>
vnoremap #< <esc>`>a><esc>`<i<<esc>
vnoremap #' <esc>`>a'<esc>`<i'<esc>
vnoremap #" <esc>`>a"<esc>`<i"<esc>

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist.vim
"set tags=./tags "now using autotags.vim to set tags
map <leader>t :TlistToggle<cr>
let Tlist_Auto_Open=0 " let the tag list open automagically
let Tlist_Compact_Format = 1 " show small menu
let Tlist_Ctags_Cmd = 'ctags' " location of ctags
let Tlist_Enable_Fold_Column = 0 " do show folding tree
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always) read my functions
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_OnSelect = 1
let Tlist_Inc_Winwidth = 0
let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
let tlist_php_settings = 'php;c:class;d:constant;f:function'

" NERD_tree.vim
map <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$','\.svn$','\.tmp$','\.bak','\~$']

" project.vim
map <leader>p :Project<cr>

" matrix.vim
map <leader>m :Matrix<cr>

" html.vim
let g:no_html_toolbar = 1
let g:do_xhtml_mappings = 'yes'
let g:html_tag_case = 'lowercase'

" closetag.vim
let g:closetag_html_style=1

" ToHTML
let use_xhtml = 1
let html_use_css = 1
let html_number_lines = 0

" mru.vim (History file List, Most Recent Used)
map <leader>h :MRU <cr>
let MRU_Max_Entries = 30
let MRU_Exclude_Files='^/tmp/.*\|^/var/tmp/.*'
let MRU_Include_Files='\.c$\|\.cpp$\|\.h$\|\.hpp$'  " For C Source
let MRU_Window_Height=15
let MRU_Add_Menu=0

" fencview.vim
let g:fencview_autodetect = 0

" acp.vim & SnipMate.vim
let g:acp_behaviorSnipmateLength =1
let g:acp_enableAtStartup = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:snips_author = 'Vingel <http://www.vingel.com/>'
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=html.django_template.jquery " For SnipMate & jquery

" fuf.vim
map <leader>fb :FufDirWithCurrentBufferDir<cr>
map <leader>fd :FufDir<cr>
map <leader>ff :FufFile<cr>
map <leader>ft :FufTag<cr>
map <leader>fh :FufHelp<cr>

" VIM
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

" Python section
" Run the current buffer in python - ie. on leader+space
autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
" set python modules path so that 'gd' can find it.
autocmd FileType python set path+=~/libs/python,~/vane/project,~/vane/project,/usr/lib/python2.5/site-packages/
" Set some bindings up for 'compile' of python
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" New Python file template
autocmd bufnewfile *.py call setline(1,'#!/usr/bin/env python') |
  \ call setline(2,'#coding:utf-8') |
  \ call setline(3,'#author: Vingel <http://www.vingel.com>') |
  \ call setline(4,'') |
  \ call setline(5,'') |
  \ exe "normal G"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set OminComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,htm set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal dict+=$VIMFILES/dict/php_functions.txt
autocmd FileType c set omnifunc=ccomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors & Fonts & Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax
syntax enable

if has("gui_running")
    colorscheme yytextmate
    " Highlight current
    set cursorline
    set cursorcolumn
    hi cursorline guibg=#333333
    hi CursorColumn guibg=#333333
    " Toggle Menu and Toolbar and switch fullscreen mode
    set guioptions-=b " Hide bottom scrollbar
    set guioptions-=R " Hide right scrollbar
    set guioptions-=r 
    set guioptions-=l " Hide left scrollbar
    set guioptions-=L
    set guioptions-=m " Hide Menu
    set guioptions-=T " Hide Toolbar
    map <silent> <F11> :if &guioptions =~# 'm' <Bar>
                \set guioptions-=m <bar>
                \else <Bar>
                \set guioptions+=m <Bar>
                \endif<cr>
    " Auto Maximize when vim starts.
    if has("win32")
        au GUIEnter * simalt ~x
    elseif has("unix")
        au GUIEnter * winpos 0 0
        "set lines=999 columns=9999
    endif
else
    set background=dark
    "colorscheme zellner
    colorscheme vivi
endif

" Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

" Syntax
au BufRead,BufNewFile *.js set ft=javascript.jquery

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set FileEncodeing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
    set encoding=utf-8
    set fileencodings=utf-8,chinese,latin-1
    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " Don' use Unicode 

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        set fileencoding=chinese
        " Anguage messages en_US.utf-8
        language messages zh_CN.utf-8
        let &termencoding=&encoding
        set guifont=Consolas:h12:cDEFAULT
        source $VIMRUNTIME\delmenu.vim
        source $VIMRUNTIME\menu.vim
        set path+=E:\Vingel\bin\python\Lib\site-packages\
        if version >= 603
          set helplang=cn
        endif
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
        set fileencoding=utf-8
    endif
else
    echoerr "Sorry, this version of gvim was not compiled with +multi_byte"
endif

if has("mac")
    set shell=bash
    colorscheme pablo
endif

if has("gui_macvim")
    set transparency=2
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My information
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set dictionary+=$VIMFILES/dict/dicts.txt,/usr/share/dict/words
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
" vim:tw=80 et sw=4 comments=\:\"
