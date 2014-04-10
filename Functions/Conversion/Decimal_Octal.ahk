; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Conversion: Decimal to Octal
;                  Conversion: Octal to Decimal
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

Msgbox, % "Decimal to Octal:`n"
        . "Decimal:`t`t(56)`n" 
        . "Octal:`t`t" . decimal_octal(56) . "`n`n"
        . "Octal to Decimal:`n"
        . "Octal:`t`t(70)`n"
        . "Decimal:`t`t" . octal_decimal(70)

ExitApp

decimal_octal(n)
{
    i = 1
    octal = 0
    while (n > 0)
    {
        rem := Mod(n, 8)
        n /= 8
        octal += rem * i
        i *= 10
    }
    return octal
}


octal_decimal(n)
{
    i = 0
    decimal = 0
    while (n != 0)
    {
        rem := Mod(n, 10)
        n /= 10
        decimal += rem * pow(8, i)
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