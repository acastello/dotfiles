colorscheme darkh

setlocal cm=blowfish2

au filetype haskell source ~/.vim/haskell.vim

map! <C-v>ta  ɐ
map! <C-v>sa  ɑ
map! <C-v>ash æ
map! <C-v>tv  ʌ
map! <C-v>hb  ɓ
map! <C-v>sb  ʙ
map! <C-v>te  ə
map! <C-v>do  ȯ
map! <C-v>'   ˈ
map! <C-v>i   ɪ
map! <C-v>sh  ʃ
map! <C-v>up  ʊ
map! <C-v>:   ː
map! <C-v>3   ɜ
map! <C-v>oo  ɔ
map! <C-v>ez  ʒ

" F10 prints the highlight group the word under the cursor belongs to
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" F11 opens the declared highlight groups
map <F11> :so $VIMRUNTIME/syntax/hitest.vim<CR>
