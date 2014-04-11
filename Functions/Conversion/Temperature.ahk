; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Convert Temperature
;                  Celsius, Kelvin, Fahrenheit, Rankine, Réaumur,
;                  Delisle, Newton, Rømer
; Modified ......: 2014.04.10-2019
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force

; SCRIPT ============================================================================

; Celsius      --> C
; Kelvin       --> K
; Fahrenheit   --> F
; Rankine      --> Ra
; Réaumur      --> Re
; Delisle      --> De
; Newton       --> N
; Rømer        --> Ro

; convTemp(Temperature in Degrees, From, To, Round by)
MsgBox, % convTemp(80, "C", "F")
MsgBox, % convTemp(212, "K", "Ra", 2)
MsgBox, % convTemp(22.7, "N", "Re", 4)

; FUNCTIONS =========================================================================


convTemp(d, f := "C", t := "F", r := 2)
{		
    d := (f = "K") ? ((d - 273.15)) : ((f = "F") ? ((d - 32) / 1.8) : ((f = "Ra") ? ((d + 5 / 9) - 273.15) : ((f = "Re") ? ((d * 1.25))
           : ((f = "De") ? ((100 - d) * 2 / 3) : ((f = "N") ? ((d * 100 / 33)) : ((f = "Ro") ? ((d - 7.5) * 40 / 21) : d ))))))
    return round((t = "C") ? d : ((t = "K") ? ((d + 273.15)) : ((t = "F") ? ((d * 1.8) + 32) : ((t = "Ra") ? ((d + 273.15) * 1.8) : ((t = "Re") ? ((d * 0.8))
           : ((t = "De") ? ((100 - d) * 1.5) : ((t = "N") ? ((d * 1 / 3)) : ((t = "Ro") ? ((d * 0.525) + 7.5) : "" ))))))), r)
}

; EXIT ==============================================================================

exitapp