ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="random"
source $ZSH/oh-my-zsh.sh

case "$OSTYPE" in
darwin*)
	PROMPT='%S%1~%s%(!.#.%%) '
	export PATH=$PATH:~/bin
	alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab "$@"'
	#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
	alias vi='mvim'
	alias ls='ls -FhG'	# ディレクトリの中身を表示したくないときは-d
;;
linux*)
	PROMPT='%n@%m%S%1~%s%(!.#.%%) '
	alias ls='ls -Fh --color'
	alias vi='vim'
;;
esac

RPROMPT='$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
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

export EDITOR='vi'
alias less='less -M'
alias grep='grep -i --color'
alias ll='ls -la'
alias du='du -sh'
alias locate='locate -i'
