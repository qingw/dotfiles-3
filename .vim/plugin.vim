" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" command-t file search
map <leader>f :CommandT<CR>

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" gundo
let g:gundo_width = 45
let g:gundo_preview_height = 20
let g:gundo_preview_bottom = 1

" tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" VTreeExplorer
map <F12> :VSTreeExplore <CR>
let g:treeExplVertical=1
let g:treeExplWinSize=35
let g:treeExplDirSort=1

" latex-suite settings
set shellslash
" program used for the ":grep" command
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='evince'

"pydiction settings"
let g:pydiction_location = '/usr/share/pydiction/complete-dict'
au FileType python setlocal iskeyword +=.,( | set dictionary+=xxx/pydiction/complete-dict

" powerline
if has("mac")
  " HomeBrew's pip install to this location
  if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
    source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
  endif
elseif has("unix")
  " pip installes to home dir
  if filereadable("~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
  endif
endif
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" syntastic
let g:syntastic_python_checkers=['flake8']
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
        \ 'active_filetypes': []}
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" vim-indent-guides
let g:indent_guides_guide_size = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" vim-timestamp
let timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'

" omnicompletion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,preview

" vim:shiftwidth=2:tabstop=8:expandtab
