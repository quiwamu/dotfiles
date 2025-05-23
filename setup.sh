#!/usr/bin/env bash

if [ -d $HOME/dotfiles ] && [ ! -d $HOME/.dotfiles ]; then
	mv $HOME/dotfiles $HOME/.dotfiles
	REPO_DIR=".dotfiles"
elif [ -d $HOME/dotfiles ]; then
	REPO_DIR="dotfiles"
elif [ -d $HOME/.dotfiles ]; then
	REPO_DIR=".dotfiles"
else
	echo "レポジトリのディレクトリ名が不正です"
	exit 1
fi

DOT_FILES=( .vimrc .bashrc .zshrc .inputrc .gitignore .tmux.conf)

for file in ${DOT_FILES[@]}
do
	if [ -L $HOME/$file ]; then
		echo "既にシンボリックリンクが存在しますが張り直します: $file"
		rm $HOME/$file
	elif [ -d $HOME/$file ] || [ -f $HOME/$file ]; then
		echo "既にファイルが存在しますので、どけておきます: $file"
		EXT=`date +%F`
		mv $HOME/$file $HOME/$file.$EXT
	fi
	ln -s $HOME/$REPO_DIR/$file $HOME/$file
	echo "シンボリックリンクを貼りますた!: $file"
done

# for oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
#	echo "pull oh-my-zsh" 
#	cd ~/.oh-my-zsh
#	git pull
	# GREP_OPTIONSの設定でエラーがでるので削除
	if [ -e $HOME/.oh-my-zsh/lib/grep.zsh ]; then
		rm $HOME/.oh-my-zsh/lib/grep.zsh
	fi
:
else
	echo "clone oh-my-zsh"
	git clone git@github.com:quiwamu/oh-my-zsh.git ~/.oh-my-zsh
fi

# vimのswpファイル置き場
if [ ! -d $HOME/.vim/swp ]; then
	mkdir $HOME/.vim/swp
fi

# for dotfiles
echo "pull dotfiles"
cd $HOME/$REPO_DIR
git pull
