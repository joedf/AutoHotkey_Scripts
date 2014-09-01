; FUNCTIONS =====================================================================================================================
; abs()          Calculates the absolute value.
; abs64()        Calculates the absolute value.
; acos()         Calculates the arccosine.
; atan()         Calculates the arctangent of x.
; atan2()        Calculates the arctangent of y/x.
; atof()         Convert a string to double.
; ceil()         Calculates the ceiling of a value.
; cos()          Calculates the cosine.
; cosh()         Calculates the hyperbolic cosine.
; floor()        Calculates the floor of a value.
; frexp()        Gets the mantissa and exponent of a floating-point number.
; hypot()        Calculates the hypotenuse.
; ldexp()        Multiplies a floating-point number by an integral power of two.
; log()          Calculates logarithms.
; log10()        Calculates base-10 logarithms.
; logb()         Extracts the exponent value of a floating-point argument.
; pow()          Calculates x raised to the power of y.
; scalb()        Scales argument by a power of 2.
; sin()          Calculates the sines.
; sinh()         Calculates the hyperbolic sines.
; tan()          Calculates the tangent.
; tanh()         Calculates the hyperbolic tangent.
; ===============================================================================================================================



; ===============================================================================================================================
; Function......: abs
; DLL...........: msvcrt.dll
; Description ..: Calculates the absolute value.
; Links.........: http://msdn.microsoft.com/en-us/library/kw1ee768.aspx
; ===============================================================================================================================
abs(n)
{
    return DllCall("msvcrt.dll\abs", "Int", n, "CDECL")
}

;MsgBox % abs(-41567)        ; ==> 41567



; ===============================================================================================================================
; Function......: _abs64
; DLL...........: msvcrt.dll
; Description ..: Calculates the absolute value.
; Links.........: http://msdn.microsoft.com/en-us/library/kw1ee768.aspx
; ===============================================================================================================================
abs64(n)
{
    return DllCall("msvcrt.dll\_abs64", "Int64", n, "CDECL Int64")
}

;MsgBox % abs64(-9876543210)        ; ==> 9876543210



; ===============================================================================================================================
; Function......: acos
; DLL...........: msvcrt.dll
; Description ..: Calculates the arccosine.
; Links.........: http://msdn.microsoft.com/en-us/library/bztkwykh.aspx
; ===============================================================================================================================
acos(x)
{
    return DllCall("msvcrt.dll\acos", "Double", x, "CDECL Double")
}

;MsgBox % acos(0)        ; ==> 1.570796



; ===============================================================================================================================
; Function......: atan
; DLL...........: msvcrt.dll
; Description ..: Calculates the arctangent of x.
; Links.........: http://msdn.microsoft.com/en-us/library/88c36t42.aspx
; ===============================================================================================================================
atan(x)
{
    return DllCall("msvcrt.dll\atan", "Double", x, "CDECL Double")
}

;MsgBox % atan(5)        ; ==> 1.373401



; ===============================================================================================================================
; Function......: atan2
; DLL...........: msvcrt.dll
; Description ..: Calculates the arctangent of y/x.
; Links.........: http://msdn.microsoft.com/en-us/library/88c36t42.aspx
; ===============================================================================================================================
atan2(y, x)
{
    return DllCall("msvcrt.dll\atan2", "Double", y, "Double", x, "CDECL Double")
}

;MsgBox % atan2(0.5, 5)        ; ==> 0.099669



; ===============================================================================================================================
; Function......: atof
; DLL...........: msvcrt.dll
; Description ..: Convert a string to double.
; Links.........: http://msdn.microsoft.com/en-us/library/hc25t012.aspx
; ===============================================================================================================================
atof(str)
{
    return DllCall("msvcrt.dll\atof", "AStr", str, "CDECL Double")
}

;MsgBox % atof(" -3.5 ")        ; ==> -3.500000



; ===============================================================================================================================
; Function......: ceil
; DLL...........: msvcrt.dll
; Description ..: Calculates the ceiling of a value.
; Links.........: http://msdn.microsoft.com/en-us/library/atdhw2dx.aspx
; ===============================================================================================================================
ceil(x)
{
    return DllCall("msvcrt.dll\ceil", "Double", x, "CDECL Double")
}

;MsgBox % ceil(2.8) " | " ceil(-2.8)        ; ==> 3.000000 | -2.000000



; ===============================================================================================================================
; Function......: cos
; DLL...........: msvcrt.dll
; Description ..: Calculates the cosine.
; Links.........: http://msdn.microsoft.com/en-us/library/ydcbat90.aspx
; ===============================================================================================================================
cos(x)
{
    return DllCall("msvcrt.dll\cos", "Double", x, "CDECL Double")
}

;MsgBox % cos(1.570796)        ; ==> 0.000000



; ===============================================================================================================================
; Function......: cosh
; DLL...........: msvcrt.dll
; Description ..: Calculates the hyperbolic cosine.
; Links.........: http://msdn.microsoft.com/en-us/library/ydcbat90.aspx
; ===============================================================================================================================
cosh(x)
{
    return DllCall("msvcrt.dll\cosh", "Double", x, "CDECL Double")
}

;MsgBox % cosh(0.785398)        ; ==> 1.324609



; ===============================================================================================================================
; Function......: floor
; DLL...........: msvcrt.dll
; Description ..: Calculates the floor of a value.
; Links.........: http://msdn.microsoft.com/en-us/library/x39715t6.aspx
; ===============================================================================================================================
floor(x)
{
    return DllCall("msvcrt.dll\floor", "Double", x, "CDECL Double")
}

;MsgBox % floor(2.8) " | " floor(-2.8)        ; ==> 2.000000 | -3.000000



; ===============================================================================================================================
; Function......: frexp
; DLL...........: msvcrt.dll
; Description ..: Gets the mantissa and exponent of a floating-point number.
; Links.........: http://msdn.microsoft.com/en-us/library/w1xfschh.aspx
; ===============================================================================================================================
frexp(x, ByRef e)
{
    return DllCall("msvcrt.dll\frexp", "Double", x, "Int*", e, "CDECL Double")
}

;MsgBox % frexp(16.4, 5) " | " frexp(16.4, 1)        ; ==> 0.512500



; ===============================================================================================================================
; Function......: hypot
; DLL...........: msvcrt.dll
; Description ..: Calculates the hypotenuse.
; Links.........: http://msdn.microsoft.com/en-us/library/w1xfschh.aspx
; ===============================================================================================================================
hypot(x, y)
{
    return DllCall("msvcrt.dll\_hypot", "Double", x, "Double", y, "CDECL Double")
}

;MsgBox % hypot(3, 4)        ; ==> 5.000000



; ===============================================================================================================================
; Function......: ldexp
; DLL...........: msvcrt.dll
; Description ..: Multiplies a floating-point number by an integral power of two.
; Links.........: http://msdn.microsoft.com/en-us/library/zx52ds7f.aspx
; ===============================================================================================================================
ldexp(x, e)
{
    return DllCall("msvcrt.dll\ldexp", "Double", x, "Int", e, "CDECL Double")
}

;MsgBox % ldexp(4, 3)        ; ==> 32.000000



; ===============================================================================================================================
; Function......: log
; DLL...........: msvcrt.dll
; Description ..: Calculates logarithms.
; Links.........: http://msdn.microsoft.com/en-us/library/t63833dz.aspx
; ===============================================================================================================================
log(x) 
{
    return DllCall("msvcrt.dll\log", "Double", x, "CDECL Double")
}

;MsgBox % log(9000)        ; ==> 9.104980



; ===============================================================================================================================
; Function......: log10
; DLL...........: msvcrt.dll
; Description ..: Calculates base-10 logarithms.
; Links.........: http://msdn.microsoft.com/en-us/library/t63833dz.aspx
; ===============================================================================================================================
log10(x)
{
    return DllCall("msvcrt.dll\log10", "Double", x, "CDECL Double")
}

;MsgBox % log10(9000)        ; ==> 3.954243



; ===============================================================================================================================
; Function......: logb
; DLL...........: msvcrt.dll
; Description ..: Extracts the exponent value of a floating-point argument.
; Links.........: http://msdn.microsoft.com/en-us/library/e4x82d9s.aspx
; ===============================================================================================================================
logb(x)
{
    return DllCall("msvcrt.dll\_logb", "Double", x, "CDECL Double")
}

;MsgBox % logb(9000)        ; ==> 13.000000



; ===============================================================================================================================
; Function......: pow
; DLL...........: msvcrt.dll
; Description ..: Calculates x raised to the power of y.
; Links.........: http://msdn.microsoft.com/en-us/library/dt5dakze.aspx
; ===============================================================================================================================
pow(x, y)
{
    return DllCall("msvcrt.dll\pow", "Double", x, "Double", y, "CDECL Double")
}

;MsgBox % pow(2, 3)        ; ==> 8.000000



; ===============================================================================================================================
; Function......: _scalb
; DLL...........: msvcrt.dll
; Description ..: Scales argument by a power of 2.
; Links.........: http://msdn.microsoft.com/en-us/library/esw6b4yx.aspx
; ===============================================================================================================================
_scalb(x, e)
{
    return DllCall("msvcrt.dll\_scalb", "Double", x, "Int", e, "CDECL Double")
}

;MsgBox % _scalb(4, 3)        ; ==> 32.000000



; ===============================================================================================================================
; Function......: sin
; DLL...........: msvcrt.dll
; Description ..: Calculates the sines.
; Links.........: http://msdn.microsoft.com/en-us/library/wkbss70y.aspx
; ===============================================================================================================================
sin(x)
{
    return DllCall("msvcrt.dll\sin", "Double", x, "CDECL Double")
}

;MsgBox % sin(1.570796)        ; ==> 1.000000



; ===============================================================================================================================
; Function......: sinh
; DLL...........: msvcrt.dll
; Description ..: Calculates the hyperbolic sines.
; Links.........: http://msdn.microsoft.com/en-us/library/wkbss70y.aspx
; ===============================================================================================================================
sinh(x)
{
    return DllCall("msvcrt.dll\sinh", "Double", x, "CDECL Double")
}

;MsgBox % sinh(1.570796)        ; ==> 2.301298



; ===============================================================================================================================
; Function......: tan
; DLL...........: msvcrt.dll
; Description ..: Calculates the tangent.
; Links.........: http://msdn.microsoft.com/en-us/library/twws9xxw.aspx
; ===============================================================================================================================
tan(x)
{
    return DllCall("msvcrt.dll\tan", "Double", x, "CDECL Double")
}

;MsgBox % tan(0.785398)        ; ==> 1.000000



; ===============================================================================================================================
; Function......: tanh
; DLL...........: msvcrt.dll
; Description ..: Calculates the hyperbolic tangent.
; Links.........: http://msdn.microsoft.com/en-us/library/twws9xxw.aspx
; ===============================================================================================================================
tanh(x)
{
    return DllCall("msvcrt.dll\tanh", "Double", x, "CDECL Double")
}

;MsgBox % tanh(1)        ; ==> 0.761594