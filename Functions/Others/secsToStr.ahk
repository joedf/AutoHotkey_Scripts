; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Seconds to String
;                  Convert Seconds to Day(s), Hour(s), Minute(s), Second(s)
;                  e.g. "1234567" -> "14 days, 6 hours, 56 minutes, 7 seconds"
; Modified ......: 2014.04.10-2019
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#NoEnv
#SingleInstance Force

; SCRIPT ============================================================================

MsgBox % secsToStr(1234567)   ; 14 days, 6 hours, 56 minutes, 7 seconds
MsgBox % secsToStr(1337)      ; 22 minutes, 17 seconds

; FUNCTIONS =========================================================================

secsToStr(s)
{
    if (s >= 86400)
    {
        d := floor(s / 86400), s := mod(s, 86400)
        r := d " day" ((d <> 1) ? "s" : "") ((s > 0) ? ", " : "")
    }
    if (s >= 3600)
    {
        h := floor(s / 3600), s := mod(s, 3600)
        r .= h " hour" ((h <> 1) ? "s" : "") ((s > 0) ? ", " : "")
    }
    if (s >= 60)
    {
        m := floor(s / 60), s := mod(s, 60)
        r .= m " minute" ((m <> 1) ? "s" : "") ((s > 0) ? ", " : "")
    }
    r .= s " second" ((s <> 1) ? "s" : "")

    return r
}

; EXIT ==============================================================================

exitapp