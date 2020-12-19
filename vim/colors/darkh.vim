set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "darkh"

hi SpecialKey       ctermfg=darkblue
hi NonText	        ctermfg=blue
hi Directory	    ctermfg=blue
hi ErrorMsg	        ctermbg=darkred     ctermfg=white
hi IncSearch	    cterm=reverse
hi Search	        ctermbg=black       ctermfg=NONE    cterm=underline
hi MoreMsg	        ctermfg=green
hi ModeMsg	        ctermfg=None        cterm=bold
hi LineNr	        ctermfg=yellow
hi CursorLineNr	    ctermfg=yellow
hi Question	        ctermfg=green
hi StatusLine	    cterm=bold,reverse
hi StatusLineNC	    cterm=reverse
hi link VertSplit	StatusLineNC
" hi Title
hi Visual	        ctermbg=darkgray
" hi VisualNOS
" hi WarningMsg
" hi WildMenu
" hi Folded
" hi FoldColumn
hi DiffAdd          ctermbg=28
hi DiffChange       ctermbg=black
hi DiffDelete       ctermbg=52          ctermfg=red
hi DiffText         ctermbg=237
" hi SignColumn
" hi Conceal
" hi SpellBad
" hi SpellCap
" hi SpellRare
" hi SpellLocal
" hi Pmenu
" hi PmenuSel
" hi PmenuSbar
" hi PmenuThumb
" hi TabLine
" hi TabLineSel
" hi TabLineFill
" hi CursorColumn
" hi CursorLine
" hi ColorColumn
" hi StatusLineTerm
" hi StatusLineTermNC
" hi Cursor
" hi lCursor
" hi MatchParen
" hi Normal
" hi ToolbarLine
" hi ToolbarButton
hi Comment	        ctermfg=cyan        cterm=italic
hi Constant	        ctermfg=magenta
hi String           ctermfg=magenta     cterm=italic
hi Special	        ctermfg=224
hi Delimiter        ctermfg=lightgray
hi Identifier	    ctermfg=cyan        cterm=bold
hi Statement	    ctermfg=yellow
hi PreProc	        ctermfg=cyan
hi Import           ctermfg=blue
hi link Namespace   Import
hi Type	            ctermfg=lightgreen
hi Underlined	    ctermfg=cyan        cterm=underline
hi Ignore	        ctermfg=black
hi Error	        ctermbg=red
hi Todo	            ctermbg=yellow
"
" interface colors
hi LineNr           ctermfg=none ctermbg=none cterm=none
hi CursorLineNr     ctermfg=none ctermbg=none cterm=none,bold
hi StatusLineTerm   term=bold,reverse cterm=bold ctermfg=0 ctermbg=39
" hi StatusLineTermNC

" Custom groups
hi ExtraWhitespace cterm=reverse ctermfg=DarkRed
