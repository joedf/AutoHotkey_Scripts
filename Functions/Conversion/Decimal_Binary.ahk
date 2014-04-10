; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Conversion: Decimal to Binary
;                  Conversion: Binary to Decimal
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

Msgbox, % "Decimal to Binary:`n"
        . "Decimal:`t`t(56)`n" 
        . "Binary:`t`t" . decimal_binary(56) . "`n`n"
        . "Binary to Decimal:`n"
        . "Binary:`t`t(111000)`n"
        . "Decimal:`t`t" . binary_decimal(111000)

ExitApp

decimal_binary(n)
{
    i = 1
    binary = 0
    while (n != 0)
    {
        rem := Mod(n, 2)
        n /= 2
        binary += rem * i
        i *= 10
    }
    return binary
}


binary_decimal(n)
{
    i = 0
    decimal = 0
    while (n != 0)
    {
        rem := Mod(n, 10)
        n /= 10
        decimal += rem * pow(2, i)
        i++
    }
    return decimal
}

pow(b, i)
{
    if (i = 0)
    {
        return 1
    }
    x := b
    loop % i - 1
    {
        x *= b
    }
    return x
}