syn     keyword cConstant       TRUE FALSE
syn     match   cType   display "\<[a-zA-Z]\+_t\>" 
syn     match   cType   display "\<U\?\(INT\|LONG\|SHORT\|CHAR\)[0-9]*\>"
syn     keyword cType           HWND WORD DWORD BOOL POINT RECT HMODULE
syn     keyword cType           LPARAM RPARAM
syn     keyword cStorageClass   WINAPI CALLBACK
syn     match   cDefine display "\<[_A-Z]\+[_A-Z0-9]\>"

