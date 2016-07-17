#!/bin/sh
DOTVIMPAHT=~/.vim
[! -e $DOTVIMPAHT] && mkdir -p $DOTVIMPAHT
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/colors ~/.vim
ln -sf ~/dotfiles/syntax ~/.vim
ln -sf ~/dotfiles/bundle ~/.vim
ln -sf ~/dotfiles/after ~/.vim
ln -sf ~/dotfiles/.xmodmap ~/.xmodmap
ln -sf ~/dotfiles/.xmonad ~/.xmonad


