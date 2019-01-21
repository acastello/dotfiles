#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
shopt -s globstar
shopt -s histappend

# docker automata
bind '"\e[29~":     "docker\e\e[29~"'
# git automata
bind '"\C-f":       "git status\n"'
bind '"\C-g":       "git \e\C-g"'
bind '"\e\C-gd":    "diff\n"'
bind '"\e\C-g\C-d": "diff\n"'
bind '"\e\C-gl":    "log --oneline --graph\n"'
bind '"\e\C-gr":    "rebase -i\n"'
bind '"\e\C-gR":    "rebase -i origin/master\n"'
bind '"\e\C-ga":    "rebase --abort\n"'
bind '"\e\C-gc":    "rebase --continue\n"'
bind '"\e\\":       " | grep -nI"'
bind '"\e`":        "\C-als -ltrA \n"'
bind '"\e1":        "\C-a\e\e[C\C-w"'

PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignorespace

# PS1='[\u@\h \W]\$ '
# PS1='\[\e[1m\][\[\e[31m\]\u\[\e[0m\]@\[\e[1;31m\]\h \[\e[1;34m\]\W\[\e[39m\]]\[\e[0m\]\$ '
# PS1='\[\e[1;37;40m\]$?\[\e[0;40;31m\]░▒\[\e[41;35m\]░ \[\e[1;37m\]\u@\h \[\e[0;41;34m\]░\[\e[31;40m\]▒░\[\e[1;37m\] \w \[\e[0;7;34m\]░▒\[\e[0;34m\]░\[\e[0m\]
# \[\e[1m\]$\[\e[0m\] '
PS1='\[\e[37;40m\]\[\e[1;31m\]\u\[\e[37m\]@\[\e[31m\]\h \[\e[34m\]\W\[\e[0;30m\]▓▒░\[\e[0m\]\[\e[1m\]$\[\e[0m\] '
# PS1='▓'

export EDITOR=vim

#useful vars
rsyncflags='-vrtuDz'
#Usr aliases
alias v=vim
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=always'
alias feh='feh -F.'
alias ebin='vim'
alias emacs='emacs -nw -Q'
alias ncmpcpp='ncmpcpp --config $HOME/.ncmpcpp/config'
alias pacman='pacman --color=always'
alias epoch='date +%s'
alias lsblkv='lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,FSTYPE,STATE,MOUNTPOINT,UUID'
alias i3exit='i3-msg exit'
alias aurman='aurman --noconfirm'
alias ffmpeg='ffmpeg -hide_banner'
