#include <HotString.au3>
#include <HotStringHelpers.au3>

;Supported keys:
;{ESC}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}
;{GRAVE}1234567890-={BACKSPACE}
;{TAB}QWERTYUIOP[]\
;{CAPSLOCK}ASDFGHJKL;{ACUTE/CEDILLA}
;{SHIFT}ZXCVBNM,./
;{CTRL}{Left Windows}{SPACE}{Right Windows}{Application}{Right Ctrl}
;{LEFT}{UP}{RIGHT}{DOWN}
;{INSERT}{HOME}{PGUP}{DELETE}{END}{PGDOWN}{Prnt Scrn}{SCROLL LOCK}{Pause}
;{Num Lock}{NUM DIVIDE}{NUMMULT}{NUM SUB}{NUM 7}{NUM 8}{NUM 9}{NUM PLUS}{NUM 4}{NUM 5}{NUM 6}{NUM 1}{NUM 2}{NUM 3}{NUM ENTER}{NUM 0}{NUM DECIMAL}


; preceeding the replacement string with ~@| means the typed string won't be deleted
;    This will have the side-effect of stopping any hotstrings which rely on the input string.
;    If you want them to stay active, then keep the delete, but retype the text in the output string

hotStringSetInit("`hsd", "{call listHotStringDuplicates()}")

hotStringSetInit("calltest", "{call calltest()}")
Func calltest()
    msgbox(1,"","you typed " & $HotStringPressed)
end Func

hotStringSetInit("{ESC}", "~@|{CTRLUP}{SHIFTUP}{ALTUP}{LWINUP}{RWINUP}")
hotStringSetInit("`pause", "{pause}{enter}{pause}Pause Demo{pause 500}Waiting 1000{pause 1000}Finished{enter}")
hotStringSetInit("`tim", "{time}{tab}{time}{tab}{time}")
hotStringSetInit("`date", "{date}{tab}{date 4w}{tab}{date 6w}{tab}{date 1m}{tab}{date 1y}{tab}")


While True
	sleep (100)
WEnd