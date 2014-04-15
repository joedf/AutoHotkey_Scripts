; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Get the weekday on any given date
;                  e.g. "1990-01-01" --> "Monday"
; Modified ......: 2014.04.15-0925
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force

; SCRIPT ============================================================================

MsgBox, % GetWeekday(1, 1, 1990)         ; 1990-01-01 --> Monday
MsgBox, % GetWeekday(4, 15, 2014)        ; 2014-04-15 --> Tuesday
MsgBox, % GetWeekday(9, 9, 1999)         ; 1999-09-09 --> Thursday

; FUNCTIONS =========================================================================

GetWeekday(month, day, year)
{
    static WeekDay := ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    d := day, m := month, y := year
    if (m < 3)
    {
        m += 12
        y -= 1
    }
    wd := mod(d + (2 * m) + floor(6 * (m + 1) / 10) + y + floor(y / 4) - floor(y / 100) + floor(y / 400) + 1, 7) + 1
    return WeekDay[wd]
}

; EXIT ==============================================================================

exitapp