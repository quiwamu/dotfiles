ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
#ZSH_THEME="random"
source $ZSH/oh-my-zsh.sh

case "$ZSH_VERSION" in
5*)
	ZSH_THEME_GIT_PROMPT_PREFIX="%S"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%s"
	ZSH_THEME_GIT_PROMPT_DIRTY=""
	ZSH_THEME_GIT_PROMPT_CLEAN=""
	ZSH_THEME_GIT_PROMPT_ADDED="%F{cyan}✈%f"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}✭%f"
	ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✗%f"
	ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}➦%f"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✂%f"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{grey}✱%f"
	;;
*)
	ZSH_THEME_GIT_PROMPT_PREFIX="%S"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%s"
	ZSH_THEME_GIT_PROMPT_DIRTY=""
	ZSH_THEME_GIT_PROMPT_CLEAN=""
	ZSH_THEME_GIT_PROMPT_ADDED="%{\033[036m%}+%{\033[0m%}"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{\033[033m%}m%{\033[0m%}"
	ZSH_THEME_GIT_PROMPT_DELETED="%{\033[031m%}x%{\033[0m%}"
	ZSH_THEME_GIT_PROMPT_RENAMED="%{\033[034m%}r%{\033[0m%}"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%{\033[035m%}u%{\033[0m%}"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{\033[032m%}*%{\033[0m%}"	
	;;
esac

case "$OSTYPE" in
darwin*)
	PROMPT='%S%1~%s%(!.#.%%) ' # サーバ名省略
	export PATH=/usr/local/bin:$PATH # for Homebrew
	export PATH=~/bin:$PATH
	alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab "$@"'
	#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
	alias vi='mvim'
	alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
	;;
linux*)
	PROMPT='%S%n%s%m%S%1~%s%(!.#.%%) ' # サーバ名表示
	alias ls='ls -F --color'
	alias vi='vim'
	;;
esac

RPROMPT='$(git_prompt_info)$(git_prompt_status)'
export EDITOR='vim'
export LESSCHARSET='utf-8'
alias less='less -M'
alias grep='grep -i --color'
alias ll='ls -la'
alias du='du -sh'
alias locate='locate -i'
unsetopt correct_all
# zmv http://mollifier.hatenablog.com/entry/20101227/p1
autoload -Uz zmv
alias zmv='noglob zmv -W' 
