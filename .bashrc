# Source global definitions
if [ -f /etc/bashrc ];then
	. /etc/bashrc
fi

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

case $OSTYPE in
	darwin*)
		# for mac
		export PS1='\[\e[1;7;32;44m\]\W\[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] '
		export PATH=/usr/local/bin:$PATH # for Homebrew
		export PATH=~/bin:$PATH
		alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab "$@"'
		alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
		alias vi='mvim'
		alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
		;;
	linux*)
		# for linux
PS1='\[\e[1;7;32;44m\]\u\[\e[0m\]\[\e[1;32m\]\h\[\e[0m\]\[\e[1;7;32;44m\]\W\[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] '
		alias ls='ls -F --color'
		alias vi='vim'
		;;
esac
export HISTCONTROL=ignoreboth	# 同じコマンドの繰り返しや、スペースで始まるコマンドを履歴に残さない
export HISTSIZE=10000
function share_history {
history -a # .bash_historyに前回コマンドを1行追記
history -c # 端末ローカルの履歴を一旦消去
history -r # .bash_historyから履歴を読み込み直す
}
export PROMPT_COMMAND="share_history" # 一回ごとに上記関数を実行
shopt -u histappend # .bash_history追記モードは不要なのでOFFに
export EDITOR='vim'
export LESSCHARSET='utf-8'
alias less='less -M'
alias grep='grep -i --color'
alias ll='ls -la'
alias du='du -sh'
alias locate='locate -i'
alias mv='mv -i'
alias cp='cp -i'
