#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd globstar histappend


# movement
bind '"\eH": shell-backward-word'
bind '"\eL": shell-forward-word'

# copy CWD
bind '"\C-xw": "pwd | sed 's.$./.' | xclip -r \n"'
# bash
bind '"\ec":        "\C-a# \n"'                 # CMD -> # CMD 	⏎
bind '"\C-x&":      "\C-a(\C-e&)\n"'                # CMD -> (CMD &) # execute detached
bind '"\C-b:":      "\C-awhile :; do \C-e ; done"'  # CMD -> while true ; do CMD ; done
bind '"\C-be":      " $EDITOR ~/.bashrc\n"'          # vim ~/.bashrc
bind '"\C-bhe":     " $EDITOR ~/.bash_persistent_history\n"'    # vim ~/.bash_history
bind '"\C-bhu":     " history -n\n"'
bind '"\C-b.":      " . ~/.bashrc\n"'                # source ~/.bashrc
bind '"\C-bn":      "\C-aν "'
bind -x '"\C-xy":   "echo -n $READLINE_LINE | xclip; echo -\>yanked"'
# find
bind '"\C-f":       "\C-afind -iname \e\C-f"'
bind '"\e\C-f":       abort'
bind '"\e\C-f\r":     "\C-w\n"'
bind '"\e\C-f1":      "\C-w-maxdepth 1 -iname \e\C-f"'
bind '"\e\C-f2":      "\C-w-maxdepth 2 -iname \e\C-f"'
bind '"\e\C-f-":      "\C-w-not -path \e\C-f\e-"'
bind '"\e\C-f\e-g":     "\\*/.git\\*\e[C -iname \e\C-f"'
bind '"\e\C-f\e-v":     "\\*/vendor/\\*\e[C\e[C -iname \e\C-f"'
bind '"\e\C-fg":      "\C-w-type f -exec grep -HnI --color=always  {} \\;\e[D\e[D\e[D\e[D\e[D\e[D"'
bind '"\e\C-f.":      "\\*\\\\."'
# grep
bind '"\eg":        "grep \e\M-g"'
bind '"\e\M-gc":    "--color=always \e\M-g"'
# kubectl
bind '"\C-k":             "kubectl \e\C-k"'
bind '"\e\C-k":             abort'
bind '"\e\C-kg":            "get \e\C-k\eg"'
bind '"\e\C-k\egw":           "-o wide \e\C-k\eg"'
bind '"\e\C-k\eg-p":          "pods -l app="'
bind '"\e\C-k\egp":           "pods | two-rows\n"'
bind '"\e\C-k\egj":           "jobs\n"'
bind '"\e\C-k\egn":           "nodes\n"'
bind '"\e\C-k\egd":           "deployments\n"'
bind '"\e\C-k\egs":           "secret -o json | jq '\''.data | map_values(@base64d)'\''\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e\e[D\e[D\e[D \e\C-k\eg\es"'
bind '"\e\C-k\eg\es":           abort'
bind '"\e\C-k\eg\es\r":         "\C-e\C-w\C-w\C-w '\'' .items | map({(.metadata.name): .data | map_values(@base64d)}) | add'\'' -C | less -r\n"'
bind '"\e\C-k\egc":           "configmap -o json | jq .data\e\e[D\e\e[D\e\e[D\e\e[D\e[D\e[D \e\C-k\eg\ec"'
bind '"\e\C-k\eg\ec":           abort'
bind '"\e\C-k\eg\ec\r":         "\C-e\C-w '\''.items | map({(.metadata.name): .data}) | add'\'' -C | less -r\n"'
bind '"\e\C-kd":            "describe \e\C-k\ed"'
bind '"\e\C-k\edi":           "| less +/Image: \e\e[D\e\e[D\e[D\e[D\e[D \e\C-k\ed"'
bind '"\e\C-k\edp":           "pod "'
bind '"\e\C-k\edd":           "deployment "'
bind '"\e\C-k\eds":           "statefulset "'
bind '"\e\C-k\edv":           "service "'
bind '"\e\C-k\edS":           "secret "'
bind '"\e\C-k\C-d":         "delete pod "'
bind '"\e\C-ke":            "edit \e\C-k\ee"'
bind '"\e\C-k\eed":           "deployment "'
bind '"\e\C-k\ees":           "statefulset "'
bind '"\e\C-k\eeh":           "horizontalpodautoscaler "'
bind '"\e\C-ks":            "scale --replicas=1 \e\C-k\es"'
bind '"\e\C-k\es2":           "\d\d2 \e\C-k\es"'
bind '"\e\C-k\es3":           "\d\d3 \e\C-k\es"'
bind '"\e\C-k\ess":           "statefulset "'
bind '"\e\C-k\esd":           "deployment "'
bind '"\e\C-kx":            "exec -it  -- bash -l\e\e\[D\e\e[D\e\e[D\e\e[C\e[C"'
bind '"\e\C-kl":            "logs | jq-maybe\e\e\[D\e\e\[D\e\[D\e\[D\e\[D \e\C-k\el"'
bind '"\e\C-k\elf":           "--follow \e\C-k\el"'
bind '"\e\C-k\el":            abort'
bind '"\e\C-k\elo":           "`KCTL-one-of `\e\[D"'
bind '"\e\C-kf":            "port-forward "'
bind '"\e\C-kp":            "proxy "'
bind '"\e\C-kt":            "top pod "'
bind '"\e\C-ko":            "\C-wKCTL-one-of "'
# docker
bind '"\C-o":         "docker \e\C-o"'
bind '"\e\C-o\C-i":     "images --filter dangling=false\n"'
bind '"\e\C-oi":        "image \e\C-o\ei"'
bind '"\e\C-o\ei\r":      "\C-wimages\n"'
bind '"\e\C-ox":        "exec -it "'
# git
bind '"\C-g":           "git \e\C-g"'
bind '"\e\C-gt":          "status\C-a \n"'
bind '"\e\C-g\C-g":          "status\C-a \n"'
bind '"\e\C-gs":          "show\n"'
bind '"\e\C-g-s":         "show --name-only\n"'
bind '"\e\C-gd":          "diff\n"'
bind '"\e\C-g-d":         "diff --stat\n"'
bind '"\e\C-g\C-d":       "diff --color-words=.\n"'
bind '"\e\C-g\C-p":       "pull\n"'
bind '"\e\C-gl":          "log --oneline --graph\n"'
bind '"\e\C-g\C-L":       "log --oneline --graph --all\n"'
bind '"\e\C-gr":          "rebase \e\C-g\er"'
bind '"\e\C-g\eri":         "-i \e\C-g\er"'
bind '"\e\C-g\erm":         "master\n"'
bind '"\e\C-g\er\C-m":      "origin/master\n"'
bind '"\e\C-g\er1":         "HEAD^\n"'
bind '"\e\C-g\er2":         "HEAD~2\n"'
bind '"\e\C-g\er3":         "HEAD~3\n"'
bind '"\e\C-g\er4":         "HEAD~4\n"'
bind '"\e\C-gR":          "rebase -i origin/master\n"'
bind '"\e\C-ga":          "rebase --abort\n"'
bind '"\e\C-gc":          "rebase --continue\n"'
bind '"\e\C-gf":          "fetch\n"'
bind '"\e\C-go":          "checkout \e\C-g\eo"'
bind '"\e\C-g\eo.":         ".\n"'
bind '"\e\C-g\eop":         "--patch "'
bind '"\e\C-g\eom":         "--conflict=merge \e\C-g\eo"'
bind '"\e\C-g\eo`1":        "HEAD^ "'
bind '"\e\C-g\eo1":         "HEAD^\n"'
bind '"\e\C-g\eo-":         "-\n"'
bind '"\e\C-g\eob":         "-B \e\C-g\eo"'
bind '"\e\C-g\C-o":       "checkout master\n"'
bind '"\e\C-gy":          "cherry-pick "'
bind '"\e\C-ge":          "reset \e\C-g\ee"'
bind '"\e\C-g\ee1":         "HEAD^\n"'
bind '"\e\C-g\ee2":         "HEAD^^\n"'
bind '"\e\C-g\ee3":         "HEAD^^^\n"'
bind '"\e\C-g\eeh":         "--hard \e\C-g\ee"'
bind '"\e\C-g\ees":         "--soft \e\C-g\ee"'
bind '"\e\C-g\C-h":       "stash\n"'
bind '"\e\C-gh":          "stash \e\C-g\eh"'
bind '"\e\C-g\ehp":         "--patch \e\C-g\eh"'
bind '"\e\C-g\ehs":         "save\n"'
bind '"\e\C-g\ehu":         "push\n"'
bind '"\e\C-g\eho":         "pop\n"'
bind '"\e\C-gC":          "clean -fd ."'
bind '"\e\C-g=":          "add ."'
bind '"\e\C-g\C-a":       "commit -a --amend --no-edit\n\e\C-g\e\C-a"'
bind '"\e\C-g\e\C-a":     abort'
bind '"\e\C-g\e\C-a\C-p": "git push --force-with-lease origin $(git rev-parse --abbrev-ref HEAD)\n"'
bind '"\e\C-g\g":         "\C-w (gitg&)\n"'
# piped grep
bind '"\e\\":       " | grep -nI \e\e\C-\\"'
bind '"\e\e\C-\\b":      "/bin/"'
bind '"\C-`":       "\C-e`\C-avim `which "'
bind '"\C-\M-w":    "\C-awatch -t -n 0.75 "'
bind '"\C-xs":      "\C-asudo "'
bind '"\e1":       "\C-a\eL\C-u"'
bind '"\e`":        "\C-als -ltrhA \n"'
bind '"\el":        forward-word'
bind '"\eL":        shell-forward-word'
# terraform
bind '"\C-\M-t":    "terraform \e\C-\M-t"'
bind '"\e\C-\M-ta":   "apply "'
bind '"\e\C-\M-ty":   "\C-aecho yes | \C-e\e\C-\M-t"'
bind '"\e\C-\M-tc":   "\C-w--target kubernetes_config_map._configmap\e\e[D\e[D"'
bind '"\e\C-\M-ts":   "\C-w--target kubernetes_secret._secret\e\e[D\e[D"'


if [[ ";${PROMPT_COMMAND};" != *"history -a;"* ]] ; then
    PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
fi
HISTFILE="$HOME/.bash_persistent_history"
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignorespace

PS1='\[\e[40m\]$(EC=$?; if [ -v SSH_CLIENT ] ; then echo '\''\[\e[1;31m\]\u\[\e[37m\]@\[\e[31m\]\h '\''; elif [ $EC -ne 0 ]; then printf '\''\[\e[1;37;41m\]'\''"%-3s" $EC; EC=0; else echo '\''\[\e[1;31m\] ~ '\''; fi)\[\e[1;34;40m\]$(if [ "$PWD" = "$HOME" ]; then echo "~"; else PPWD="$(basename "$(dirname "$PWD")")"; if [ ${#PPWD} -gt 15 ]; then echo "${PPWD::10}‥"'\''\[\e[21;37m\]/\[\e[1;34m\]'\''"$(basename "$PWD")"; else echo "${PPWD}"'\''\[\e[21;37m\]/\[\e[1;34m\]'\''"$(basename "$PWD")"; fi; fi)\[\e[1;36m\]$(b="$(git branch-name 2>/dev/null)"; if [ "$b" = master ]; then echo " µ"; elif [ "$b" = HEAD ]; then echo " ĥ"; elif [ -n "$b" ]; then echo " $b" ; fi)\[\e[0;30m\]▓▒░\[\e[0m\]\[\e[1m\]$\[\e[0m\] '

export EDITOR=vim

#useful vars
rsyncflags='-vrtuDz'

#Usr aliases
alias g='grep --color=always -Irn'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias feh='feh -F.'
alias ebin='vim'
alias emacs='emacs -nw -Q'
alias ncmpcpp='ncmpcpp --config $HOME/.ncmpcpp/config'
alias pacman='pacman --color=auto'
alias epoch='date +%s'
alias lsblkv='lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,FSTYPE,STATE,MOUNTPOINT,UUID'
alias i3exit='i3-msg exit'
alias aurman='aurman --noconfirm'
alias ffmpeg='ffmpeg -hide_banner'
alias v=vim
alias v-json='vim -c ":set ft=json"'

# nu, not v. as in ν-tify
ν() {
    eval "$@"
    ec=$?
    if [ $ec -ne 0 ]; then
        notify-send -i dialog-error "asd" "$*"
        (exit $?;) # convoluted af way to set error code without closing bash
    else
        notify-send "bash νοτιφ" "$*"
    fi
}


# vim: tw=0
