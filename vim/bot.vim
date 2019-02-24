setl autoindent
setl expandtab
setl softtabstop=2
setl shiftwidth=4
setl nowrap

if exists("b:current_syntax")
    finish
endif

syn match   bFunc       'func \(.*\)'
syn keyword bSymbol     {
syn match   bOp         "[-^+/]\+"
syn match   bNum        "\<[0-9]\+\>\|\0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match   bFloat		"\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>\|pi"
syn keyword bNone       _
syn region  bString     start=+"+ skip=+\\\\\|\\"+ end=+"+ 

let b:current_syntax = "bot"

hi def link bFunc    Label
hi def link bSymbol  Operator
hi def link bOp      Operator
hi def link bString  String
hi def link bNum     Number
hi def link bNum     Number
hi def link bFloat   Number
hi def link bNone    Number
