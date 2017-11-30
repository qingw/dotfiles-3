"==================================================================================
"          FILE:  ~/.vim/keymap.vim
"        AUTHOR:  Fisher Duan <steamedfish@njuopen.com>
" Last Modified:  Fri 18 Sep 2009 03:47:26 AM CST
"==================================================================================

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

" CTRL-U makes uppercase
inoremap <C-U> <ESC>vawU2eli
nnoremap <C-U> vawUel

" Key mappings to ease browsing long lines
noremap  <C-J>       gj
noremap  <C-K>       gk
noremap  <Down>      gj
noremap  <Up>        gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk

" Key mappings for quick arithmetic inside Vim
nnoremap <silent> <Leader>ma yypV:!calcu '<C-R>"'<CR>k$
vnoremap <silent> <Leader>ma yo<ESC>pV:!calcu '<C-R>"'<CR>k$
nnoremap <silent> <Leader>mr yyV:!calcu '<C-R>"'<CR>$
vnoremap <silent> <Leader>mr ygvmaomb:r !calcu '<C-R>"'<CR>"ay$dd`bv`a"ap

" Key mapping to stop the search highlight
nmap <silent> <F2>      :nohlsearch<CR>
imap <silent> <F2> <C-O>:nohlsearch<CR>

" Key mappings for the quickfix commands
nmap <F11> :cn<CR>
nmap <F12> :cp<CR>

map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

" close window (conflicts with the KDE setting for calling the process manager)
 noremap  <C-Esc>       :close<CR>
inoremap  <C-Esc>  <C-C>:close<CR>

" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
 noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
nnoremap  <C-q>    :wqall<CR>

"  some additional hot keys
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>

imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>

" autocomplete parenthesis, brackets and braces
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

vnoremap ( s()<Esc>P
vnoremap [ s[]<Esc>P
vnoremap { s{}<Esc>P

" autocomplete quotes
vnoremap  '  s''<Esc>P<Right>
vnoremap  "  s""<Esc>P<Right>
vnoremap  `  s``<Esc>P<Right>

inoremap        '  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
inoremap        "  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
inoremap        `  `<Esc>:call QuoteInsertionWrapper('`')<CR>a

" Add a second quote only if the left and the right character are not keyword
" characters.
function! QuoteInsertionWrapper (quote)
        let     col     = col('.')
        if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
                normal ax
                exe "normal r".a:quote."h"
        end
endfunction    " ----------  end of function QuoteInsertionWrapper  ----------

" vim:shiftwidth=2:tabstop=8:expandtab
