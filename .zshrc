ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
#ZSH_THEME="random"
plugins=(git)
source $ZSH/oh-my-zsh.sh

	ZSH_THEME_GIT_PROMPT_PREFIX="%S%{$fg_bold[green]%}%{$bg[blue]%}"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%s"
	ZSH_THEME_GIT_PROMPT_DIRTY=""
	ZSH_THEME_GIT_PROMPT_CLEAN=""
	ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}m%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}x%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}r%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}u%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}*%{$reset_color%}"

case "$OSTYPE" in
darwin*)
	PROMPT='%S%{$fg_bold[green]%}%{$bg[blue]%}%1~%{$reset_color%}%s%{$fg_bold[green]%}%(!.#.%%)%{$reset_color%} ' # サーバ名省略
	export PATH=/usr/local/bin:$PATH # for Homebrew
	export PATH=~/bin:$PATH
	alias vi='vim'
	alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
	# for pycaffe
	export PYTHONPATH=/Users/quiwamu/AI/caffe/python:$PYTHONPATH
	;;
linux*)
	PROMPT='%S%{$fg_bold[green]%}%{$bg[blue]%}%n%{$reset_color%}%s%{$fg_bold[green]%}%m%{$reset_color%}%S%{$fg_bold[green]%}%{$bg[blue]%}%1~%{$reset_color%}%s%{$fg_bold[green]%}%(!.#.%%)%{$reset_color%} ' # サーバ名表示
	alias ls='ls -F --color'
	alias vi='vim'
	;;
freebsd*)
	# for sakura
	PROMPT='%S%{$fg_bold[green]%}%{$bg[blue]%}%n%{$reset_color%}%s%{$fg_bold[green]%}%m%{$reset_color%}%S%{$fg_bold[green]%}%{$bg[blue]%}%1~%{$reset_color%}%s%{$fg_bold[green]%}%(!.#.%%)%{$reset_color%} '
	alias vi='vim'
	alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
	;;
esac

unsetopt promptcr
RPROMPT=' $(git_prompt_info)$(git_prompt_status)'
export EDITOR='vim'
export LESSCHARSET='utf-8'
alias less='less -M'
alias grep='grep -i --color'
alias ll='ls -la'
alias lh='ls -lat | head'
alias du='du -sh'
alias locate='locate -i'
alias crontab='crontab -i'
alias kakunin='wget -q -O - http://test.psss.co.jp/kakunin.php'
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"

unsetopt correct_all
# zmv http://mollifier.hatenablog.com/entry/20101227/p1
autoload -Uz zmv
alias zmv='noglob zmv -W' 
export PYENV_ROOT=$HOME/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
	export PATH=${PYENV_ROOT}/bin:$PATH
	eval "$(pyenv init -)"
fi
export GREP_OPTIONS=
