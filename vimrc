colorscheme darkh

setlocal cm=blowfish2

set ttymouse=sgr
set clipboard=unnamedplus

" positioning
set cul
set cuc
set relativenumber
set nu

" dimensions
set so=7
set siso=10
set cwh=15
set laststatus=2
set winwidth=86 winheight=26
set winminwidth=12 winminheight=2

set list
set listchars=tab:>-

set virtualedit=all

map t gt
map T gT

set hlsearch

set tags=./tags;

set fixendofline

map <C-W><C-T> :term<CR>
nmap <C-c> :q<CR>

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

nnoremap ,,e :e!<CR>

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
