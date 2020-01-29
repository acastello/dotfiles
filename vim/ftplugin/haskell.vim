vnoremap i :!column -ts: -o:
nnoremap j :up \| :!
            \xdotool search --name --onlyvisible 'stack' windowfocus --sync sleep 0.1 key alt+j & 

setlocal comments=s1f:{-#,ex:#-},s1fl:{-,mb:-,ex:-},:-- commentstring=--\ %s
