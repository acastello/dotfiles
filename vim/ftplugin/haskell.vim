vnoremap i :!column -ts: -o:
nnoremap j :up \| :!
            \sleep 0.2 ; xdotool key Ctrl+2 Alt+j & 

setlocal comments=s1f:{-#,ex:#-},s1fl:{-,mb:-,ex:-},:-- commentstring=--\ %s
setlocal winwidth=101
