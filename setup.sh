#!/bin/sh

DOT_FILES=( .vimrc .bashrc .zshrc .inputrc .gitignore)

for file in ${DOT_FILES[@]}
do
	if [ -a $HOME/$file ]; then
		if [ -L $HOME/$file ]; then
			echo "既にシンボリックリンクが存在します: $file"
		elif [ -d $HOME/$file ]; then
			echo "既にディレクトリが存在します: $file"
		else
			echo "既にファイルが存在しますので、どけておきます: $file"
			mv $HOME/$file $HOME/$file.1
			ln -s $HOME/dotfiles/$file $HOME/$file
			echo "シンボリックリンクを貼りますた: $file"
		fi
	else
		ln -s $HOME/dotfiles/$file $HOME/$file
		echo "シンボリックリンクを貼りますた: $file"
	fi
done

# for oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
	echo "pull oh-my-zsh" 
	cd ~/.oh-my-zsh
	git pull
else
	echo "clone oh-my-zsh"
	git clone git://github.com/quiwamu/oh-my-zsh.git ~/.oh-my-zsh
fi
