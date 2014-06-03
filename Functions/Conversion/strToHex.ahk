; ===================================================================================
; AHK Version ...: AHK_L 1.1.15.00 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Convert Hex to String
;                  http://msdn.microsoft.com/en-us/library/yakksftt.aspx
; Modified ......: 2014.06.02-1829
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox % "Text:`tAutHotkey`nHex:`t" strToHex("AutHotkey")
ExitApp

; FUNCTIONS =========================================================================

strToHex(str)
{
    static v := A_IsUnicode ? "_i64tow" : "_i64toa"
    hex := ""
    loop, parse, str
    {
        VarSetCapacity(s, 65, 0)
        DllCall("msvcrt.dll\" v, "Int64", Asc(A_LoopField), "Str", s, "UInt", 16, "CDECL")
        hex .= "0x" s " "
    }
    return SubStr(hex, 1, (StrLen(hex) - 1))
}

; EXIT ==============================================================================