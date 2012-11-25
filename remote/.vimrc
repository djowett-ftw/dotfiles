syntax on

set background=light
colorscheme desert

set cursorline                      " highlight current line
set number                          " show line numbers
set encoding=utf-8                  " default encoding
set fileformat=unix                 " default file format
set scrolloff=1
set backspace=indent,eol,start      " backspace should work as expected
set vb                              " visual bell
set ls=2                            " show filename in status bar
set ruler                           " show position in statusbar
set showmatch                       " show closing brackets
    " do not edit files of these types
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp
autocmd BufEnter * lcd %:p:h        " always switch working directory to directory of current file

" INDENTING SETTINGS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" Indent/Dedent with Tab
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >gv
vnoremap <S-Tab> <LT>gv


" SEARCH SETTINGS
set hlsearch
set incsearch


" TABS
map ä :tabn<CR>
map ü :tabp<CR>
map ö :tabnew<CR>
map $ :q<CR>
map - :e .<CR>
set showtabline=2                   " always show tab bar

" SPLITS
" ... move cursor around
nmap <A-LEFT> <C-W><LEFT>           " move left
nmap <A-RIGHT> <C-W><RIGHT>         " move right
nmap <A-UP> <C-W><UP>               " move up
nmap <A-DOWN> <C-W><DOWN>           " move down
" ... resize
nmap <A-D-LEFT> <C-W><              " decrease width
nmap <A-D-RIGHT> <C-W>>             " increase width
nmap <A-D-UP> 2<C-W>-               " decrease height
nmap <A-D-DOWN> 2<C-W>+             " increase height
nmap <A-D-CR> 1000<C-W>>1000<C-W>+  " maximize window
" ... move / rotate windows
nmap <A-D-C-LEFT><LEFT> <C-W>r      " retate windows
nmap <A-D-C-LEFT><RIGHT> <C-W>R     " reverse rotate windows
nmap <A-D-C-RIGHT> <C-W>x           " exchange window with next one
nmap <A-D-C-UP><UP> <C-W>K          " move to top
nmap <A-D-C-UP><DOWN> <C-W>J        " move to bottom
nmap <A-D-C-UP><LEFT> <C-W>H        " move to left
nmap <A-D-C-UP><RIGHT> <C-W>L       " move to right


" VARIOUS MAPPINGS
let maplocalleader = ","
    " toggle white-space
map W :set list!<CR>
    " _ : edit vimrc
map _ :tabnew<CR>:e ~/.vimrc<CR>

"" general shortcut mappings
map qe :e<CR>
map qqe :e!<CR>
map qw :w<CR>
map qqw :w!<CR>
map qn :enew<CR>
map qqn :enew!<CR>
map qd :diffoff<CR>:diffthis<CR>
map qqd :diffoff<CR>


"" HIGHLIGHTING
autocmd BufRead *.kss set filetype=css
autocmd BufRead *.css.dtml set filetype=css
autocmd BufRead *.zcml set filetype=xml
autocmd BufRead *.props set filetype=cfg
autocmd BufRead *.txt set filetype=doctest
