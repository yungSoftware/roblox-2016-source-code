# Microsoft Developer Studio Project File - Name="wwwcore" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=wwwcore - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "wwwcore.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwcore.mak" CFG="wwwcore - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwcore - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwcore - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wwwcore - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\wwwcore\Release"
# PROP BASE Intermediate_Dir ".\wwwcore\Release"
# PROP BASE Target_Dir ".\wwwcore"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\Bin"
# PROP Intermediate_Dir ".\wwwcore\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ".\wwwcore"
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /machine:I386 /out:"..\..\..\Bin\Release\wwwcore.dll"

!ELSEIF  "$(CFG)" == "wwwcore - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\wwwcore\Debug"
# PROP BASE Intermediate_Dir ".\wwwcore\Debug"
# PROP BASE Target_Dir ".\wwwcore"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\Bin"
# PROP Intermediate_Dir ".\wwwcore\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ".\wwwcore"
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"..\..\..\Bin\Debug\wwwcore.dll"

!ENDIF 

# Begin Target

# Name "wwwcore - Win32 Release"
# Name "wwwcore - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\HTAlert.c
# End Source File
# Begin Source File

SOURCE=..\HTAnchor.c
# End Source File
# Begin Source File

SOURCE=..\HTChannl.c
# End Source File
# Begin Source File

SOURCE=..\HTDNS.c
# End Source File
# Begin Source File

SOURCE=..\HTError.c
# End Source File
# Begin Source File

SOURCE=..\HTEscape.c
# End Source File
# Begin Source File

SOURCE=..\HTEvent.c
# End Source File
# Begin Source File

SOURCE=..\HTFormat.c
# End Source File
# Begin Source File

SOURCE=..\HTHost.c
# End Source File
# Begin Source File

SOURCE=..\HTInet.c
# End Source File
# Begin Source File

SOURCE=..\HTLib.c
# End Source File
# Begin Source File

SOURCE=..\HTLink.c
# End Source File
# Begin Source File

SOURCE=..\HTMemLog.c
# End Source File
# Begin Source File

SOURCE=..\HTMethod.c
# End Source File
# Begin Source File

SOURCE=..\HTNet.c
# End Source File
# Begin Source File

SOURCE=..\HTNoFree.c
# End Source File
# Begin Source File

SOURCE=..\HTParse.c
# End Source File
# Begin Source File

SOURCE=..\HTProt.c
# End Source File
# Begin Source File

SOURCE=..\HTReqMan.c
# End Source File
# Begin Source File

SOURCE=..\HTResponse.c
# End Source File
# Begin Source File

SOURCE=..\HTStream.c
# End Source File
# Begin Source File

SOURCE=..\HTTCP.c
# End Source File
# Begin Source File

SOURCE=..\HTTimer.c
# End Source File
# Begin Source File

SOURCE=..\HTTrans.c
# End Source File
# Begin Source File

SOURCE=..\HTUser.c
# End Source File
# Begin Source File

SOURCE=..\HTUTree.c
# End Source File
# Begin Source File

SOURCE=..\HTWWWStr.c
# End Source File
# Begin Source File

SOURCE=.\windll.c
# End Source File
# Begin Source File

SOURCE=.\wwwcore.def
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\config.h
# End Source File
# Begin Source File

SOURCE=..\HTAlert.h
# End Source File
# Begin Source File

SOURCE=..\HTAnchor.h
# End Source File
# Begin Source File

SOURCE=..\HTChannl.h
# End Source File
# Begin Source File

SOURCE=..\HTDNS.h
# End Source File
# Begin Source File

SOURCE=..\HTError.h
# End Source File
# Begin Source File

SOURCE=..\HTEscape.h
# End Source File
# Begin Source File

SOURCE=..\HTEvent.h
# End Source File
# Begin Source File

SOURCE=..\HTFormat.h
# End Source File
# Begin Source File

SOURCE=..\HTHost.h
# End Source File
# Begin Source File

SOURCE=..\HTInet.h
# End Source File
# Begin Source File

SOURCE=..\HTLib.h
# End Source File
# Begin Source File

SOURCE=..\HTLink.h
# End Source File
# Begin Source File

SOURCE=..\HTMemLog.h
# End Source File
# Begin Source File

SOURCE=..\HTMethod.h
# End Source File
# Begin Source File

SOURCE=..\HTNet.h
# End Source File
# Begin Source File

SOURCE=..\HTNoFree.h
# End Source File
# Begin Source File

SOURCE=..\HTParse.h
# End Source File
# Begin Source File

SOURCE=..\HTProt.h
# End Source File
# Begin Source File

SOURCE=..\HTReqMan.h
# End Source File
# Begin Source File

SOURCE=..\HTResponse.h
# End Source File
# Begin Source File

SOURCE=..\HTStream.h
# End Source File
# Begin Source File

SOURCE=..\HTTCP.h
# End Source File
# Begin Source File

SOURCE=..\HTTimer.h
# End Source File
# Begin Source File

SOURCE=..\HTTrans.h
# End Source File
# Begin Source File

SOURCE=..\HTUser.h
# End Source File
# Begin Source File

SOURCE=..\HTUTree.h
# End Source File
# Begin Source File

SOURCE=..\HTWWWStr.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
