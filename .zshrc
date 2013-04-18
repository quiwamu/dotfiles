ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="random"
source $ZSH/oh-my-zsh.sh

case "$OSTYPE" in
darwin*)
	PROMPT='%S%1~%s%(!.#.%%) '
	RPROMPT='$(git_prompt_info)$(git_prompt_status)'
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

	export PATH=$PATH:~/bin
	export PATH=/usr/local/bin:$PATH # for Homebrew
	alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab "$@"'
	#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
	alias vi='mvim'
	alias ls='ls -FG'	# ディレクトリの中身を表示したくないときは-d
	;;
linux*)
	PROMPT='%S%n%s%m%S%1~%s%(!.#.%%) '
	RPROMPT=' $(git_prompt_info)$(git_prompt_status)'
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

	alias ls='ls -F --color'
	alias vi='vim'
	;;
esac

export EDITOR='vim'
alias less='less -rM'
alias grep='grep -i --color'
alias ll='ls -la'
alias du='du -sh'
alias locate='locate -i'
