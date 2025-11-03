;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
gl=git log --oneline --all --graph --decorate $*
l=ls --show-control-chars -lAFhv --color $*
ls=ls --show-control-chars -F --color $*
clear=cls
unalias=alias /d $1
