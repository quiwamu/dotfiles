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
		export PS1='\[\033[7m\]\W\[\033[0m\]\$ '
		export PATH=$PATH:~/bin
		export PATH=/usr/local/bin:$PATH # for Homebrew
		alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab "$@"'
		alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
		alias vi='mvim'
		alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
		;;
	linux*)
		# for linux
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
alias less='less -M'
alias grep='grep -i --color'
alias ll='ls -la'
alias du='du -sh'
alias locate='locate -i'
