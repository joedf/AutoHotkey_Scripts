; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: BaseConversion
;                  Convert Base from 2 - 16
; Modified ......: 2014.04.10-2012
; Author ........: hd0202
; Modified ......: jNizM
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox, % "Decimal:`t`t42`n"
        . "to Binary:`t`t"      convert(10, 2, 42)       "`n"
        . "to Octal:`t`t"       convert(10, 8, 42)       "`n"
        . "to Hexadecimal:`t"   convert(10, 16, 42)      "`n`n"
        . "Octal:`t`t52`n" 
        . "to Decimal:`t"       convert(8, 10, 52)       "`n"
        . "to Binary:`t`t"      convert(8, 2, 52)        "`n"
        . "to Hexadecimal:`t"   convert(8, 16, 52)       "`n`n"
        . "Binary:`t`t101010`n"
        . "to Decimal:`t"       convert(2, 10, 101010)   "`n"
        . "to Octal:`t`t"       convert(2, 8, 101010)    "`n"
        . "to Hexadecimal:`t"   convert(2, 16, 101010)   "`n`n"
        . "Hexadecimal:`t2A`n"
        . "to Decimal:`t"       convert(16, 10, "2A")    "`n"
        . "to Octal:`t`t"       convert(16, 8, "2A")     "`n"
        . "to Binary:`t`t"      convert(16, 2, "2A")     "`n`n"
ExitApp

convert(from, to, n)
{
    if (from > 16 or from < 1 or to > 16 or to < 1)
        return "error"
    x := n
    if (from <> 10)
        x := to_decimal(from, n)
    if (x = -1)
        return "error"
    n := x
    if (to <> 10)
        n := from_decimal(to, x)
    return n
}

from_decimal(to, n)
{
    hex := "0123456789ABCDEF"
    r := ""
    while (n > 0)
    {
        rem := Mod(n, to)
        n /= to
        y := SubStr(hex, rem + 1, 1)
        r = % y . r
    }
    return r
}

to_decimal(from, n)
{
    hex := SubStr("0123456789ABCDEF", 1, from)
    d = 0
    loop % StrLen(n)
    {
        d *= from
        StringGetPos, p, hex, % SubStr(n, A_Index, 1)
        if (p = -1)
            return p
        d += p
    }
    return d
}