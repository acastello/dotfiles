#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd globstar histappend


# copy CWD
bind '"\C-xw": "pwd | sed 's.$./.' | xclip -r \n"'
# bash
bind '"\ec":        "\C-a# \C-e\n"'                 # CMD -> # CMD 	⏎
bind '"\C-x&":      "\C-a(\C-e&)\n"'                # CMD -> (CMD &) # execute detached
bind '"\C-b:":      "\C-awhile :; do \C-e ; done"'  # CMD -> while true ; do CMD ; done
bind '"\C-be":      "$EDITOR ~/.bashrc\n"'          # vim ~/.bashrc
bind '"\C-bhe":     "$EDITOR ~/.bash_history\n"'    # vim ~/.bash_history
bind '"\C-bhu":     "history -n\n"'
bind '"\C-b.":      ". ~/.bashrc\n"'                # source ~/.bashrc
# find
bind '"\C-f":       "\C-afind -iname \e\C-f"'
bind '"\e\C-f\r":     "\C-w\n"'
bind '"\e\C-f1":      "\C-w-maxdepth 1 -iname \e\C-f"'
bind '"\e\C-f2":      "\C-w-maxdepth 2 -iname \e\C-f"'
bind '"\e\C-f-":      "\C-w-not -path \e\C-f\e-"'
bind '"\e\C-f\e-g":     "\\*/.git\\*\e[C -iname \e\C-f"'
bind '"\e\C-f\e-v":     "\\*/vendor/\\*\e[C\e[C -iname \e\C-f"'
bind '"\e\C-fg":      "\C-w-exec grep -HnI --color=always  {} \\;\e[D\e[D\e[D\e[D\e[D\e[D"'
bind '"\e\C-f.":      "\\*\\\\."'
# docker
# bind '"\e[29~":     "docker\e\e[29~"'
# kubectl
bind '"\C-k":         "kubectl \e\C-k"'
bind '"\e\C-kg":        "get \e\C-k\eg"'
bind '"\e\C-k\egp":       "pods\n"'
bind '"\e\C-k\eg\C-p":    "pods \e\C-k\eg\e\C-p"'
bind '"\e\C-k\eg\e\C-pl":   "-l app="'
bind '"\e\C-k\egs":       "secret -o json | jq '\''.data | map_values(@base64d)'\''\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e[D\e[D "'
bind '"\e\C-k\egc":       "configmap -o json | jq .data\e\e[D\e\e[D\e\e[D\e\e[D\e[D\e[D "'
bind '"\e\C-kd":        "describe \e\C-k\ed"'
bind '"\e\C-k\edp":       "pod "'
bind '"\e\C-k\edd":       "deployment "'
bind '"\e\C-k\eds":       "statefulset "'
bind '"\e\C-k\edv":       "service "'
bind '"\e\C-kD":        "delete \e\C-k\eD"'
bind '"\e\C-k\eDp":       "pod "'
bind '"\e\C-ke":        "edit \e\C-k\ee"'
bind '"\e\C-k\ees":       "statefulset "'
bind '"\e\C-kl":        "logs \e\C-k\el"'
bind '"\e\C-k\elf":       "--follow "'
bind '"\e\C-kf":        "port-forward "'
bind '"\e\C-kp":        "proxy "'
# git
bind '"\C-g":       "git \e\C-g"'
bind '"\e\C-gt":      "status\n"'
bind '"\e\C-gs":      "show\n"'
bind '"\e\C-gd":      "diff\n"'
bind '"\e\C-g\C-d":   "diff\n"'
bind '"\e\C-g\C-p":   "pull\n"'
bind '"\e\C-gl":      "log --oneline --graph\n"'
bind '"\e\C-gr":      "rebase -i\n"'
bind '"\e\C-gR":      "rebase -i origin/master\n"'
bind '"\e\C-ga":      "rebase --abort\n"'
bind '"\e\C-gc":      "rebase --continue\n"'
bind '"\e\C-go":      "checkout "'
bind '"\e\C-gy":      "cherry-pick "'
bind '"\e\C-ge":      "reset "'
bind '"\e\C-g\C-a":   "commit -a --amend --no-edit\n"'
# piped grep
bind '"\e\\":       " | grep -nI \e\e\C-\\"'
bind '"\e\e\C-\\b":      "/bin/"'
bind '"\C-`":       "\C-e`\C-avim `which "'
bind '"\C-\M-w":    "\C-awatch -n 0.5 "'
bind '"\C-xs":      "\C-asudo "'
bind '"\M-1":       "\C-a\e\e[C\C-u"'
bind '"\e`":        "ls -ltrhA\n"'


PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignorespace

# PS1='[\u@\h \W]\$ '
# PS1='\[\e[1m\][\[\e[31m\]\u\[\e[0m\]@\[\e[1;31m\]\h \[\e[1;34m\]\W\[\e[39m\]]\[\e[0m\]\$ '
# PS1='\[\e[1;37;40m\]$?\[\e[0;40;31m\]░▒\[\e[41;35m\]░ \[\e[1;37m\]\u@\h \[\e[0;41;34m\]░\[\e[31;40m\]▒░\[\e[1;37m\] \w \[\e[0;7;34m\]░▒\[\e[0;34m\]░\[\e[0m\]
# \[\e[1m\]$\[\e[0m\] '
# PS1='\[\e[37;40m\]\[\e[1;31m\]\u\[\e[37m\]@\[\e[31m\]\h \[\e[34m\]\W\[\e[0;30m\]▓▒░\[\e[0m\]\[\e[1m\]$\[\e[0m\] '
PS1='\[\e[37;40m\]\[\e[1;31m\]\u\[\e[37m\]@\[\e[31m\]\h \[\e[34m\]\W \[\e[1;36m\]`git branch-name 2>/dev/null`\[\e[0;30m\]▓▒░\[\e[0m\]\[\e[1m\]$\[\e[0m\] '
# PS1='▓'

export EDITOR=vim

#useful vars
rsyncflags='-vrtuDz'
#Usr aliases
alias v=vim
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
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

# workspace aliases
alias .w='cd "$WORKSPACE"'
alias .g='cd "$WORKSPACE/golang/src/rs.daimler.com"'

# vim: tw=0
