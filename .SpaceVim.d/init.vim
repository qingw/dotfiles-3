let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#puppet')
call SpaceVim#layers#load('lang#sh')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#json')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('ctrlp')
call SpaceVim#layers#load('colorscheme')
call SpaceVim#layers#load('debug')
call SpaceVim#layers#load('default')
call SpaceVim#layers#load('denite')
call SpaceVim#layers#load('edit')
call SpaceVim#layers#load('format')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('github')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('operator')
call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('tags')
call SpaceVim#layers#load('tumx')
call SpaceVim#layers#load('ui')
let g:spacevim_enable_vimfiler_welcome = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
let g:spacevim_max_column = 80
let g:spacevim_colorscheme = 'solarized'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_relativenumber = 0

if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint')
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint')
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

" let g:spacevim_custom_plugins = [
    " ['vim-pandoc/vim-pandoc'],
    " ['vim-pandoc/vim-pandoc-syntax'],
" ]

let g:spacevim_guifont = 'SauceCodePro\ Nerd\ Font:h12'

set list
set listchars=tab:➟➟,trail:❚,extends:>
set spelllang=en,cjk
set fileencodings=ucs-bom,utf-8,gbk,cp936,default,latin1

if has("gui_macvim")
    set transparency=15
endif
