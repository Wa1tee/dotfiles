# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export PICO_SDK_PATH=/home/waitee/koodit/pico-sdk
export CSCOPE_EDITOR=`which nvim`


alias explorer="xdg-open"
alias pers="source ~/.bashrc"

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\t $ "

# PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n> '

# Shift+tab backwards
bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'

bind 'Control-q: complete'

bind 'set show-all-if-ambiguous on'


## arrow up
bind '"\e[A":history-search-backward'
## arrow down
bind '"\e[B":history-search-forward'
## Ctrl+right
bind '"\e[1;5C":forward-word'
## Ctrl+left
bind '"\e[1;5D":backward-word'

