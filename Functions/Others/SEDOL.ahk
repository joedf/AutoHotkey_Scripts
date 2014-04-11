; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Checksum: SEDOL
;                  https://en.wikipedia.org/wiki/SEDOL
; Modified ......: 2014.04.10-2019
; Author ........: an AHK-Member
; Modified ......: jNizM
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox % SEDOL("710889")   ;7108899
MsgBox % SEDOL("B0YBKJ")   ;B0YBKJ7
MsgBox % SEDOL("406566")   ;4065663
MsgBox % SEDOL("B0YBLH")   ;B0YBLH2
MsgBox % SEDOL("228276")   ;2282765
MsgBox % SEDOL("B0YBKL")   ;B0YBKL9
MsgBox % SEDOL("557910")   ;5579107
MsgBox % SEDOL("B0YBKR")   ;B0YBKR5
MsgBox % SEDOL("585284")   ;5852842
MsgBox % SEDOL("B0YBKT")   ;B0YBKT7

; FUNCTIONS =========================================================================

SEDOL(w)
{
    static weights := [1,3,1,7,3,9]
	s := ""
    loop parse, w
    {
        s += ((c := Asc(A_LoopField)) >= 65 ? c - 65 + 10 : c - 48) * weights[A_Index]
    }
    return w Mod(10 - Mod(s, 10), 10)
}

; EXIT ==============================================================================

exitapp