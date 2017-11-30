"==================================================================================
"          FILE:  ~/.vim/autocmd.vim
"        AUTHOR:  Fisher Duan <steamedfish@njuopen.com>
" Last Modified:  Wed 25 Dec 2013 11:52:21 AM CST
"==================================================================================

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END

  augroup programs

    " Mark .asm files MASM-type assembly
    autocmd BufNewFile,BufReadPre *.asm let b:asmsyntax='masm' 
    " The current directory is the directory of the file in the current window.
    autocmd BufEnter * :lchdir %:p:h
    " Recognize standard C++ headers
    au BufEnter /usr/include/c++/*    setf cpp

    autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
    autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    "Python iMaps
    au FileType python set cindent
    au FileType python set foldmethod=indent
    au FileType python inoremap <buffer> $r return
    au FileType python inoremap <buffer> $s self
    au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
    au FileType python inoremap <buffer> $i import
    au FileType python inoremap <buffer> $p print
    au FileType python inoremap <buffer> $d """<cr>"""<esc>O
    "Run in the Python interpreter
    function! Python_Eval_VSplit() range
      let src = tempname()
      let dst = tempname()
      execute ": " . a:firstline . "," . a:lastline . "w " . src
      execute ":!python " . src . " > " . dst
      execute ":pedit! " . dst
    endfunction
    au FileType python vmap <F7> :call Python_Eval_VSplit()<cr>

    autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
    autocmd FileType vim set nofen

    autocmd FileType html,cheetah set ft=xml
    autocmd FileType html,cheetah set syntax=html

    autocmd FileType php compiler php
    autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
    
    autocmd FileType puppet set shiftwidth=2 tabstop=2 expandtab
    autocmd FileType puppet :iabbrev <buffer> elseif elsif
    autocmd FileType puppet :iabbrev <buffer> elif elsif
        
  augroup END

endif " has("autocmd")

" vim:shiftwidth=2:tabstop=8:expandtab
