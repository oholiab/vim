#!/bin/bash

mkdir bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.vimrc ~/.nvimrc
vim +PluginInstall +qall
