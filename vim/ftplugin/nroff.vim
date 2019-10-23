inoremap wa \['a]
inoremap we \['e]
inoremap wi \['i]
inoremap wo \['o]
inoremap wu \['u]
inoremap w; \[~n]

inoremap << \*«
inoremap >> \*»

nnoremap j :up \| :!
            \[[ % -nt %:r.pdf ]] && groff -R -T pdf -ms % > %:r.pdf;
            \xdotool search --name -onlyvisible 'llpp.*%:r.pdf' windowfocus key r \|\|
            \llpp %:r.pdf &
