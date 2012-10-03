#!/bin/sh

DOT_FILES=( .vimrc .bashrc .zshrc .inputrc .vimrc )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します: $file"
    else
      echo "既にファイルが存在します: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りますた: $file"
  fi
done

# for oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
  echo "pull oh-my-zsh \n git pull git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
else
  echo "clone oh-my-zshNo directory! $HOME/.oh-my-zsh \n git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
fi
