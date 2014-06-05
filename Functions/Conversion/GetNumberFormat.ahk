; ===================================================================================
; AHK Version ...: AHK_L 1.1.15.00 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: GetNumberFormat
;                  http://msdn.microsoft.com/en-us/library/windows/desktop/dd318110(v=vs.85).aspx
;                  http://msdn.microsoft.com/en-us/goglobal/bb896001.aspx
; Modified ......: 2014.06.04-1919
; Author ........: just me
; Modified ......: jNizM
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox % GetNumberFormat(1337.37)                ; 0x0400 LOCALE_SYSTEM_DEFAULT
MsgBox % GetNumberFormat(1337.37, 0x0809)        ; 0x0809 [en-GB] nglish (United Kingdom)
MsgBox % GetNumberFormat(1337.37, 0x0409)        ; 0x0409 [en-US] English (United States)
MsgBox % GetNumberFormat(1337.37, 0x0407)        ; 0x0407 [de-DE] German (Germany)

; FUNCTIONS =========================================================================

GetNumberFormat(lpValue, Locale := 0x0400)
{
    cchNumber := DllCall("Kernel32.dll\GetNumberFormat", "UInt", Locale, "UInt", 0, "Str", lpValue, "Ptr", 0, "Ptr", 0, "Int", 0)
    VarSetCapacity(lpNumberStr, cchNumber * (A_IsUnicode ? 2 : 1), 0)
    if (DllCall("Kernel32.dll\GetNumberFormat", "UInt", Locale, "UInt", 0, "Str", lpValue, "Ptr", 0, "Str", lpNumberStr, "Int", cchNumber))
    {
        return lpNumberStr
    }
}

; EXIT ==============================================================================

ExitApp