; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: RegisterFonts
;                  http://www.marshwiggle.net/regfont/
; Modified ......: 2014.04.11-1218
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================
;@Ahk2Exe-SetName RegisterFonts
;@Ahk2Exe-SetDescription RegisterFonts
;@Ahk2Exe-SetVersion v0.3
;@Ahk2Exe-SetCopyright Copyright (c) 2014`, jNizM
;@Ahk2Exe-SetOrigFilename RegisterFonts.ahk
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force

global pathFont      := "\\10.50.1.200\daten\apps\fonts\"   ; Path to Fonts ( *.ttf | *.otf )
global pathRegFont   := "\\10.50.1.200\daten\apps\fonts\"   ; Path to RegFont.exe
global arrFont       := []                                  ; Create an array ( arrFont[]     )
global arrFontName   := []                                  ; Create an array ( arrFontName[] )
global count         := ""                                  ; Assign variable ( count )

; SCRIPT ============================================================================

loop, % pathFont "*.*",, 1
{
    if (A_LoopFileExt ~= "i)[to]tf")
    {
        count++
        arrFont[count]     := A_LoopFileFullPath
        arrFontName[count] := A_LoopFileName
    }
}

for each, item in arrFont
{
    RunWait, % pathRegFont "regfont.exe -a " Chr(34) arrFont[A_Index] Chr(34), % pathRegFont, hide
    TrayTip, RegFont, % "Register: " arrFontName[A_Index]
}

TrayTip, RegFont, % arrFont.MaxIndex() " fonts were registered."
sleep 5000

; EXIT ==============================================================================

VarSetCapacity(pathFont, 0)                                 ; Free Memory
VarSetCapacity(pathRegFont, 0)                              ; Free Memory
VarSetCapacity(arrFont, 0)                                  ; Free Memory
VarSetCapacity(arrFontName, 0)                              ; Free Memory
VarSetCapacity(count, 0)                                    ; Free Memory

exitapp