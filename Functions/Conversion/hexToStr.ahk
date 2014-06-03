; ===================================================================================
; AHK Version ...: AHK_L 1.1.15.00 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Convert Hex to String
;                  http://msdn.microsoft.com/de-de/library/85zk715d.aspx
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

MsgBox % "Hex:`t0x41 0x75 0x74 0x48 0x6f 0x74 0x6b 0x65 0x79`nHex:`t" hexToStr("0x41 0x75 0x74 0x48 0x6f 0x74 0x6b 0x65 0x79")
ExitApp

; FUNCTIONS =========================================================================

hexToStr(hex)
{
    static u := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    char := ""
    loop, parse, hex, " "
    {
        char .= Chr(DllCall("msvcrt.dll\" u, "Str", A_LoopField, "Uint", 0, "UInt", 16, "CDECL Int64"))
    }
    return char
}

; EXIT ==============================================================================