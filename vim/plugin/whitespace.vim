" trailing whitespace handling
autocmd BufWritePre * %s/\s\+$//e

" fallback definition
hi link ExtraWhitespace ErrorMsg
match ExtraWhitespace /\s\+$/
