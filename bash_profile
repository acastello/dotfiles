#
# ~/.bash_profile
#

if [ ! -v SSH_AGENT_PID ]; then
    eval `ssh-agent`
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi
