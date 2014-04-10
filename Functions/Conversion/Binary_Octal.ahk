; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Conversion: Binary to Octal
;                  Conversion: Octal to Binary
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

Msgbox, % "Binary to Octal:`n"
        . "Binary:`t`t(111000)`n" 
        . "Octal:`t`t" . binary_octal(111000) . "`n`n"
        . "Octal to Binary:`n"
        . "Octal:`t`t(70)`n"
        . "Binary:`t`t" . octal_binary(70)

ExitApp

binary_octal(n)
{
    i = 0
    octal = 0
    decimal = 0
    while (n != 0)
    {
        decimal += Mod(n, 10) * pow(2, i)
        i++
        n /= 10
    }
    i = 1
    while (decimal != 0)    
    {
        octal += Mod(decimal, 8) * i
        decimal /= 8
        i *= 10
    }
    return octal
}


octal_binary(n)
{
    i = 0
    decimal = 0
    binary = 0
    while (n != 0)
    {
        decimal += Mod(n, 10) * pow(8, i)
        i++
        n /= 10
    }
    i = 1
    while (decimal != 0)
    {
        binary += Mod(decimal, 2) * i
        decimal /= 2
        i *= 10
    }
    return binary
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