if exists("b:current_syntax")
    finish
endif

syn keyword class   Warrior Paladin Hunter Rogue Priest 
syn keyword class   DeathKnight Shaman Mage Warlock Druid
syn match   pLevel  '\d\+'
syn keyword prof    Mining Herbalism Skinning Leatherworking Blacksmithing Jewelcrafting Engineering Alchemy Inscription Enchanting Tailoring Fishing Cooking nextrgoup=pLevel skipwhite
syn region  cTitle   start='\[' end='\]' 

let b:current_syntax = "wowprofile"

hi def link class   Type
hi def link pLevel  Number
hi def link prof    Statement
hi def link cTitle  StatusLine
