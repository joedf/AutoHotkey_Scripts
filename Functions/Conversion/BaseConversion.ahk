; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: BaseConversion
; Version .......: 2014.04.09-1927
; Author ........: hd0202
; Modified ......: jNizM
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines, -1

; SCRIPT ============================================================================

MsgBox, % "Dezimal (10) - Octal (8) `n`n"
        . "Dezimal '122' to Octal ??? --> "     convert(10, 8, 122)     "`n"
        . "Octal '172' to Dezimal ??? --> "     convert(8, 10, 172)

MsgBox, % "Octal (8) - Binär (2) `n`n"
        . "Octal '122' to Binär ??????? --> "   convert(8, 2, 122)      "`n"
        . "Binär '1010010' to Octal ??? --> "   convert(2, 8, 1010010)

MsgBox, % "Hex (16) - Binär (2) `n`n"
        . "Hex 'CB' to Binär ??????? --> "      convert(16, 2, "CB")    "`n"
        . "Binär '11001011' to Hex ?? --> "     convert(2, 16, 11001011)

MsgBox, % convert(3, 16, 122)
MsgBox, % convert(16, 3, "11")

ExitApp

convert(from, to, n)
{
    if (from > 16 or from < 1 or to > 16 or to < 1)
    {
        return "error"
    }
    x := n
    if (from <> 10)
    {
        x := to_decimal(from, n)
    }
    if (x = -1)
    {
        return "error"
    }
    n := x
    if (to <> 10)
    {
        n := from_decimal(to, x)
    }
    return n
}

from_decimal(to, n)
{
    hex := "0123456789ABCDEF"
    result := ""
    while (n > 0)
    {
        rem := Mod(n, to)
        n /= to
        y := SubStr(hex, rem + 1, 1)
        result = %y%%result%
    }
    return result
}

to_decimal(from, n)
{
    hex := SubStr("0123456789ABCDEF", 1, from)
    decimal = 0
    loop % StrLen(n)
    {
        decimal *= from
        StringGetPos, p, hex, % SubStr(n, A_Index, 1)
        if (p = -1)
        {
            return p
        }
        decimal += p
    }
    return decimal
}