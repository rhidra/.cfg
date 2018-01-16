"-----------------------------------------------------------
"                          plugins
"-----------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.config/vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Status line
Plugin 'itchyny/lightline.vim'

" Git support
Plugin 'airblade/vim-gitgutter'

" Haxadecimal color highlight
Plugin 'skammer/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------------------------------------------------------
"                      user interface
"-----------------------------------------------------------

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
set number

set nocompatible
set laststatus=2               " bottom status bar, 2=always

" colours for light background / dark foreground:
set background=light
" otherwise:
" set background=dark

" Try to show 3 lines/2 cols of context when scrolling
set scrolloff=3
set sidescrolloff=2

" line numbers
set numberwidth=3
" F10 toggles line numbers on the left
map <F10> :set invnumber<CR>

"-----------------------------------------------------------
"                    detect filetypes
"-----------------------------------------------------------

filetype plugin on
filetype indent on



"-----------------------------------------------------------
"                indentation, tabulations
"-----------------------------------------------------------

set smartindent   " auto indentation

set tabstop=2     " 1 tab == 2 spaces
set shiftwidth=2  " 1 indent == 2 spaces
set shiftround    " use multiples of 'shiftwidth'
set expandtab     " write spaces instead of tabs
set formatoptions-=cro  " don't automaticaly insert a comment

" If you want to indent text:
" <Esc>         go to normal mode
" >>            indent current line once to the right
" <<            indent current line once to the left
" 3>>           indent 3 lines once to the right
"
" To select lines before indenting them:
" <Esc>
" <Shift>-V
" <down> or j or } or any other movement
" >
"
" Reminder: dot (.) repeats the last action.
" So, to indent 5 lines 3 times on the right:
" 5>>..



"-----------------------------------------------------------
"                    moving around
"-----------------------------------------------------------

" when pasting text or code with the mouse (middle-click):
" F11 toggles 'smart' indent:
map <F11> :set invpaste<CR>
set pastetoggle=<F11>  " also work in insert mode



"-----------------------------------------------------------
"                  search and replace
"-----------------------------------------------------------

set ignorecase " searches are case-insensitive
set smartcase  " unless we type an upper-case character

set incsearch  " show the `best match so far'
set hlsearch   " highlight search

" shortcut for 'replace all': just type ;;
noremap ;; :%s:::g<Left><Left><Left>



"-----------------------------------------------------------
"                        comments
"-----------------------------------------------------------

" usage example (try it right now):
"
" <Esc>           go to normal mode
" <Shift>-V       go to visual mode, full lines selection
" <down> or }     select any number of lines. Then, type either:
"
" ,/              comment each selected line with //           (C, Java)
" ,#              comment each selected line with #            (shell)
" ,<              comment each selected line with <!-- ... --> (XML)
" ,c              remove single-line comments on each selected line
" ,u              remove multi-line comments on each selected line

" single-line comments:
map <silent> ,# :s/^/#/<CR><Esc>:nohlsearch<CR>
map <silent> ,/ :s/^/\/\//<CR><Esc>:nohlsearch<CR>
map <silent> ,> :s/^/> /<CR><Esc>:nohlsearch<CR>
map <silent> ," :s/^/\"/<CR><Esc>:nohlsearch<CR>
map <silent> ,% :s/^/%/<CR><Esc>:nohlsearch<CR>
map <silent> ,! :s/^/!/<CR><Esc>:nohlsearch<CR>
map <silent> ,; :s/^/;/<CR><Esc>:nohlsearch<CR>
map <silent> ,- :s/^/--/<CR><Esc>:nohlsearch<CR>
map <silent> ,d :s/^/dnl /<CR><Esc>:nohlsearch<CR>
" uncomment
map <silent> ,c :s:\(^\s*\)\(//\\|--\\|> \\|[#"%!;]\\|dnl \):\1:e<CR><Esc>:nohlsearch<CR>

" multi-line comments:
map <silent> ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>
map <silent> ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR><Esc>:nohlsearch<CR>
map <silent> ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" uncomment
map <silent> ,u :s:\(^\s*\)\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$:\1\3:e<CR><Esc>:nohlsearch<CR>



"-----------------------------------------------------------
"                  shortcuts you should know
  "-----------------------------------------------------------
  "
  " K                reaches the man page for the current word
" g Ctrl-G         counts words, lines and chars
" :Explore | :Ex | :n <some_dir>      to explore directories
"

