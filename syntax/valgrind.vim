" Vim syntax file
" File type: valgrind(.rpt)
" Maintainer: Matthew Zhu
" Latest Revision: 25 Nov 2023

if exists("b:current_syntax")
    finish
endif

" Match index
syntax match valgrindIndex '==\d\+=='

" Match keywords
syntax match valgrindSummary 'ERROR SUMMARY:'
syntax match valgrindSummary 'HEAP SUMMARY:'
syntax match valgrindSummary 'LEAK SUMMARY:'

" Match conclusion information
syntax match valgrindConinfo 'All heap blocks were freed -- no leaks are possible'

" Match root cause information
syntax match valgrindRcinfo '\d\+ errors from \d\+ contexts'
syntax match valgrindRcinfo 'Address 0x[0-9a-fA-F]\+ is not stack\'d, malloc\'d or (recently) free\'d'
syntax match valgrindRcinfo 'operator delete'
syntax match valgrindRcinfo "operator new\(\[\]\)\?"
syntax match valgrindRcinfo 'operator new'

" For testing
syntax match valgrindRcinfo '0x[0-9a-fA-F]\+ f\'d ()'

" Match problem information
syntax match valgrindProinfo '\d\+ bytes in \d\+ blocks are definitely lost in loss record \d\+ of \d\+'
syntax match valgrindProinfo 'Argument \'size\' of function malloc has a fishy (possibly negative) value:'
syntax match valgrindProinfo 'Conditional jump or move depends on uninitialised value(s)'
syntax match valgrindProinfo 'definitely lost: \d\+ bytes in \d\+ blocks'
syntax match valgrindProinfo 'indirectly lost: \d\+ bytes in \d\+ blocks.'
syntax match valgrindProinfo 'Invalid free() \/ delete \/ delete\[\] \/ realloc()'
syntax match valgrindProinfo 'Invalid read of size \d\+'
syntax match valgrindProinfo 'Mismatched free() \/ delete \/ delete \[\]'
syntax match valgrindProinfo 'Process terminating with default action of signal \d\+ (SIGSEGV)'
syntax match valgrindProinfo 'realloc() with size 0'
syntax match valgrindProinfo 'Source and destination overlap in memcpy(0x[0-9a-fA-F]\+, 0x[0-9a-fA-F]\+, \d\+)'
syntax match valgrindProinfo 'Syscall param \b\w\+([^\)]*) contains uninitialised byte(s)'
syntax match valgrindProinfo 'Syscall param \b\w\+([^\)]*) points to uninitialised byte(s)'
syntax match valgrindProinfo 'Use of uninitialised value of size \d\+'

" Match call stack
syntax match valgrindCallstack '\w\+<\?\w\+>\?::\w\+('
" syntax match valgrindSourcefiles '(\(in\s\)\?\(\.\*\?\))'
syntax match valgrindSourcefiles '(\(in\s\)\?\(\.\*\?\):\?\d\+)'

" Set hightlights
let b:current_syntax = "valgrind"
" highlight valgrindIndex ctermfg=
highlight default link valgrindIndex Comment
highlight default link valgrindSummary Include 
highlight default link valgrindConinfo Include
highlight default link valgrindRcinfo Keyword
highlight default link valgrindProinfo Number 
highlight default link valgrindCallstack Include 
highlight default link valgrindSourcefiles Include 
