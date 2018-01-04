" evim has its own settings at evim.vim
if v:progname =~? "evim"
  finish
endif

" Basic vim settings goes here
source ~/.vim/settings.vim
" MacVim settings
source ~/.vim/macvim.vim
" Vundle settings
source ~/.vim/vundle.vim
" My own keymaps
source ~/.vim/keymaps.vim
" autocmd settings
source ~/.vim/autocmd.vim
" plugin settings
source ~/.vim/plugin.vim
source ~/.vim/scripts.vim

" vim:shiftwidth=2:tabstop=8:expandtab
