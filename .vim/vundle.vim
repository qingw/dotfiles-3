filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'puppetlabs/puppet-syntax-vim.git'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'vim-scripts/AutoComplPop.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/bufexplorer.zip.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'vim-scripts/vim2ansi.git'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'git://git.wincent.com/command-t.git'


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

" powerline
if has("mac")
  " HomeBrew's pip install to this location
  if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
    set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
  endif
elseif has("unix")
  " pip installes to home dir
  if filereadable("~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
  endif
endif

" fzf
if filereadable("/usr/local/bin/fzf")
  set rtp+=/usr/local/opt/fzf
endif
