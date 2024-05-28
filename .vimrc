set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vim-airline/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/vim-markdown'
Plugin 'chaimleib/vim-renpy'
Plugin 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

set cursorline
set ttyfast
set mouse=a
syntax on
set shell=/bin/bash
set number
