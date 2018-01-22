" .vimrc file by Fisher Duan <steamedfish@njuopen.com>

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" search commands wrap around the end of the buffer
set wrapscan
" do incremental searching
set incsearch
" list of flags specifying which commands wrap to another line
set whichwrap+=<,>,h,l
" change the way backslashes are used in search patterns
set magic
" ignore case when using a search pattern
"set ignorecase
" override 'ignorecase' when pattern has upper case characters
set smartcase

" when completing tags in Insert mode show more info
set showfulltag
" use cseope for tag commands
set cscopetag
" give messages when adding a cscope database
set cscopeverbose

" number of lines to scroll for CTRL-U and CTRL-D
set scroll=16
" number of screen lines to show around the cursor
set scrolloff=3
" long lines wrap
set wrap
" wrap long lines at a character in 'breaket'
set linebreak
" minimal number of columns to scroll horizontally
set sidescroll=0
" minimal number of columns to keep left and right of the cursor
set sidescrolloff=0
" number of lines used for the command-line
set cmdheight=1
" width of the display
"set columns=87
" number of lines in the display
"set lines=65
" don't redraw while executing macros
set lazyredraw
" timeout for 'hlsearch' and :match highlighting in msec
set redrawtime=2000
" show <tab> as ^I and end-of-line as $
set list
" list of strings used for list mode
set listchars=tab:▸-
" show the line number for each line
set number

" when the terminal has colors
if &t_Co > 1 || has("gui_running")
  " "dark" or "light"; the background color brightness
  set background=dark
"  colorscheme molokai
  " highlight all matchs for the last used search pattern
  set hlsearch
  " highlight speling mistakes
  " set spell
  " list of accepted languages
  set spelllang=en,cjk
  syntax on
  " Highlight space errors in C/C++ source files (Vim tip #935)
  if $VIM_HATE_SPACE_ERRORS != '0'
    let c_space_errors=1
  endif
  " Show syntax highlighting attributes of character under cursor (Vim script #383)
  map <Leader>a :call SyntaxAttr()<CR>
  set colorcolumn=81
endif

" 0, 1 or 2; when to use a status line for the last window
set laststatus=2
" alternate format to be used for a status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" make all windows the same size then adding/removing windows
set equalalways
" in which direction 'equalalways' works: "ver", "hor" or "both"
set eadirection=both
" don't unload a buffer when no longer shown in a window
set hidden

" show info in the window title
set title
" set the text of the icon for this window
set icon

if has('mouse')
  " list of flags for using the mouse
  set mouse=a
  " the window with the mouse pointer becomes the current one
  set mousefocus
  " hide the mouse pointer while typing
  set mousehide
  " "extend", "popup" or "popup_setpos"; what the right mouse button is used for
  set mousemodel=extend
endif

if has("gui_running")
  " list of flags that specify how the GUI works
  set guioptions-=T
  " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
  " let &guioptions = substitute(&guioptions, "t", "", "g")
  let do_syntax_sel_menu=1
  " highlight the screen line of the cursor
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
  set guifont=Sauce\ Code\ Powerline:h12
endif

" name of the font to be used for :hardcopy
" set printfont=Monaco
" format of the header used for :hardcopy
set printheader=%<%f%h%m%=Page\ %N
" encoding used to print the PostScript file for :hardcopy
"set printencoding=
" the CJK character set to be used for CJK output from :hardcopy
"set printmbcharset=
" list of font names to be used for CJK output from :hardcopy
"printmbfont=

" show (partial) command keys in the status line
set showcmd
" display the current mode in the status line
set showmode
" show cursor position below each window
set ruler
" alternate format to be used for the ruler
"set rulerformat
" the higher the more messages are given
set verbose=0
" pause listings when the screen is full
set more
" start a dialog when a command fails
set noconfirm
" ring the bell for error messages
set errorbells
" use a visual bell instead of beeping
set visualbell

" maximum number of changes that can be undone
set undolevels=10000
" specifies what <BS>, CTRL-W, etc. can do in Insert mode
set backspace=indent,eol,start
" list of flags that tell how automatic formatting works
set formatoptions+=mM
" specifies how Insert mode completion works for CTRL-N and CTRL-P
set complete+=k
" whether to use a popup menu for Insert mode completion
set completeopt=menu,preview,longest
" When inserting a bracket, briefly jump to its match
set showmatch
" list of pairs that match for the "%" command
set matchpairs=(:),{:},[:],<:>
" use two spaces after '.' when joining a line
"set joinspaces

" number of spaces a <Tab> in the text stands for
set tabstop=4
" number of spaces used for each step of (auto)indent
set shiftwidth=4
" if non-zero, number of spaces to insert for a <Tab>
set softtabstop=4
" round to 'shiftwidth' for "<<" and ">>"
set shiftround
" expand <Tab> to spaces in Insert mode
set expandtab
" automatically set the indent of a new line
set autoindent
" do clever autoindenting
set smartindent
" enable specific indenting for C code
" set cindent
" list of words that cause more C-indent
"set cinwords=if,else,while,do,for,switch

" set to display all folds open
set foldenable
" folds with a level higher than this number will be closed
set foldlevel=99
" value for 'foldlevel' when starting to edit a file
set foldlevelstart=-1
" set to "all" to close a fold when the cursor leaves it
" width of the column used to indicate folds
"set foldcolumn=4
"set foldclose=all
" specifies for which commands a fold will be opened
"set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
" minimum number of screen lines for a fold to be closed
set foldminlines=5
" template for comments; used to put the marker in
"set commentstring=/*%s*/
" folding type: "manual", "indent", "expr", "marker" or "syntax"
set foldmethod=syntax

" enable using settings from modelines when reading a file
set modeline
" number of lines to check for modelines
set modelines=5
" last line in the file has an end-of-line
set endofline
" list of file formats to look for when editing a file
set fileformats=unix,dos,mac
" do not keep a backup file
set nobackup
" automatically write a file when leaving a modified buffer
set noautowrite
" automatically read a file when it was modified outside of Vim
set autoread
" automatically save and restore undo history
set undofile
set undodir=~/.vim/undo/

" use a swap file for this buffer
set swapfile

" how many command lines are remembered
set history=500
" command-line completion shows a list of matches
set wildmenu

" character encoding used in Vim: "latin1", "utf-8", "euc-jp", "big5", etc.
set encoding=utf8
" character encoding for the current file
set fileencodings=ucs-bom,utf-8,gbk,cp936,default
" character encoding used by the terminal
set termencoding=utf-8
if has('multi_byte') && v:version > 601
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    " width of ambiguous width characters
    set ambiwidth=double
  endif
endif

" vim:shiftwidth=2:tabstop=8:expandtab
