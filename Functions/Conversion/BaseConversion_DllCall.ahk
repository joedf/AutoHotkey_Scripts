; ===================================================================================
; AHK Version ...: AHK_L 1.1.15.00 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: BaseConversion
;                  Convert Base from 2 - 36 via DllCall
;                  http://msdn.microsoft.com/de-de/library/85zk715d.aspx
;                  http://msdn.microsoft.com/en-us/library/yakksftt.aspx
; Modified ......: 2014.06.02-1826
; Author ........: Laszlo
; Modified ......: Gogo (Guests), jNizM
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox, % "Decimal:`t`t42`n"
        . "to Binary:`t`t"      ConvertBase(10, 2, 42)       "`n"
        . "to Octal:`t`t"       ConvertBase(10, 8, 42)       "`n"
        . "to Hexadecimal:`t"   ConvertBase(10, 16, 42)      "`n`n"
        . "Octal:`t`t52`n" 
        . "to Decimal:`t"       ConvertBase(8, 10, 52)       "`n"
        . "to Binary:`t`t"      ConvertBase(8, 2, 52)        "`n"
        . "to Hexadecimal:`t"   ConvertBase(8, 16, 52)       "`n`n"
        . "Binary:`t`t101010`n"
        . "to Decimal:`t"       ConvertBase(2, 10, 101010)   "`n"
        . "to Octal:`t`t"       ConvertBase(2, 8, 101010)    "`n"
        . "to Hexadecimal:`t"   ConvertBase(2, 16, 101010)   "`n`n"
        . "Hexadecimal:`t2A`n"
        . "to Decimal:`t"       ConvertBase(16, 10, "2A")    "`n"
        . "to Octal:`t`t"       ConvertBase(16, 8, "2A")     "`n"
        . "to Binary:`t`t"      ConvertBase(16, 2, "2A")     "`n`n"
ExitApp

; FUNCTIONS =========================================================================

ConvertBase(InputBase, OutputBase, nptr)
{
    static u := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static v := A_IsUnicode ? "_i64tow"    : "_i64toa"
    VarSetCapacity(s, 66, 0)
    value := DllCall("msvcrt.dll\" u, "Str", nptr, "UInt", 0, "UInt", InputBase, "CDECL Int64")
    DllCall("msvcrt.dll\" v, "Int64", value, "Str", s, "UInt", OutputBase, "CDECL")
    return s
}

; EXIT ==============================================================================