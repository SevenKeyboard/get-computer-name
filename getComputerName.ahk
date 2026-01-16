#Requires AutoHotkey v2.0.0+
;==============================================================
; getComputerName — Gets the local computer name via GetComputerName
;
; GitHub: https://github.com/SevenKeyboard/get-computer-name
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;
; Documentation / References:
;   GetComputerNameW function (winbase.h)
;     https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-getcomputernamew
;==============================================================
class VersionManager_getComputerName
{
    static _ := this._init()
    static _init()    {
        global
        GETCOMPUTERNAME_VERSION := "1.0.0"
    }
}
getComputerName()    {
    static MAX_COMPUTERNAME_LENGTH := 15
    nSize := MAX_COMPUTERNAME_LENGTH + 1
    lpBuffer := buffer(nSize * 2, 0)
    if (!dllCall("Kernel32.dll\GetComputerName", "Ptr",lpBuffer.Ptr, "UInt*",nSize, "Int"))
        return
    return strGet(lpBuffer, nSize, "UTF-16")
}