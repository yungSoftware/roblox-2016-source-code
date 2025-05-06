# Microsoft Developer Studio Generated NMAKE File, Based on wwwcore.dsp
!IF "$(CFG)" == ""
CFG=wwwcore - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwcore - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwcore - Win32 Release" && "$(CFG)" != "wwwcore - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wwwcore - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwcore\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwcore.dll"

!ELSE 

ALL : "wwwutils - Win32 Release" "wwwdll - Win32 Release" "$(OUTDIR)\Release\wwwcore.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAlert.obj"
	-@erase "$(INTDIR)\HTAnchor.obj"
	-@erase "$(INTDIR)\HTChannl.obj"
	-@erase "$(INTDIR)\HTDNS.obj"
	-@erase "$(INTDIR)\HTError.obj"
	-@erase "$(INTDIR)\HTEscape.obj"
	-@erase "$(INTDIR)\HTEvent.obj"
	-@erase "$(INTDIR)\HTFormat.obj"
	-@erase "$(INTDIR)\HTHost.obj"
	-@erase "$(INTDIR)\HTInet.obj"
	-@erase "$(INTDIR)\HTLib.obj"
	-@erase "$(INTDIR)\HTLink.obj"
	-@erase "$(INTDIR)\HTMemLog.obj"
	-@erase "$(INTDIR)\HTMethod.obj"
	-@erase "$(INTDIR)\HTNet.obj"
	-@erase "$(INTDIR)\HTNoFree.obj"
	-@erase "$(INTDIR)\HTParse.obj"
	-@erase "$(INTDIR)\HTProt.obj"
	-@erase "$(INTDIR)\HTReqMan.obj"
	-@erase "$(INTDIR)\HTResponse.obj"
	-@erase "$(INTDIR)\HTStream.obj"
	-@erase "$(INTDIR)\HTTCP.obj"
	-@erase "$(INTDIR)\HTTimer.obj"
	-@erase "$(INTDIR)\HTTrans.obj"
	-@erase "$(INTDIR)\HTUser.obj"
	-@erase "$(INTDIR)\HTUTree.obj"
	-@erase "$(INTDIR)\HTWWWStr.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwcore.dll"
	-@erase "$(OUTDIR)\wwwcore.exp"
	-@erase "$(OUTDIR)\wwwcore.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwcore.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwcore.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwcore.pdb" /machine:I386 /def:".\wwwcore.def" /out:"$(OUTDIR)\Release\wwwcore.dll" /implib:"$(OUTDIR)\wwwcore.lib" 
DEF_FILE= \
	".\wwwcore.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAlert.obj" \
	"$(INTDIR)\HTAnchor.obj" \
	"$(INTDIR)\HTChannl.obj" \
	"$(INTDIR)\HTDNS.obj" \
	"$(INTDIR)\HTError.obj" \
	"$(INTDIR)\HTEscape.obj" \
	"$(INTDIR)\HTEvent.obj" \
	"$(INTDIR)\HTFormat.obj" \
	"$(INTDIR)\HTHost.obj" \
	"$(INTDIR)\HTInet.obj" \
	"$(INTDIR)\HTLib.obj" \
	"$(INTDIR)\HTLink.obj" \
	"$(INTDIR)\HTMemLog.obj" \
	"$(INTDIR)\HTMethod.obj" \
	"$(INTDIR)\HTNet.obj" \
	"$(INTDIR)\HTNoFree.obj" \
	"$(INTDIR)\HTParse.obj" \
	"$(INTDIR)\HTProt.obj" \
	"$(INTDIR)\HTReqMan.obj" \
	"$(INTDIR)\HTResponse.obj" \
	"$(INTDIR)\HTStream.obj" \
	"$(INTDIR)\HTTCP.obj" \
	"$(INTDIR)\HTTimer.obj" \
	"$(INTDIR)\HTTrans.obj" \
	"$(INTDIR)\HTUser.obj" \
	"$(INTDIR)\HTUTree.obj" \
	"$(INTDIR)\HTWWWStr.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Release\wwwcore.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwcore - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwcore\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwcore.dll"

!ELSE 

ALL : "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "$(OUTDIR)\Debug\wwwcore.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAlert.obj"
	-@erase "$(INTDIR)\HTAnchor.obj"
	-@erase "$(INTDIR)\HTChannl.obj"
	-@erase "$(INTDIR)\HTDNS.obj"
	-@erase "$(INTDIR)\HTError.obj"
	-@erase "$(INTDIR)\HTEscape.obj"
	-@erase "$(INTDIR)\HTEvent.obj"
	-@erase "$(INTDIR)\HTFormat.obj"
	-@erase "$(INTDIR)\HTHost.obj"
	-@erase "$(INTDIR)\HTInet.obj"
	-@erase "$(INTDIR)\HTLib.obj"
	-@erase "$(INTDIR)\HTLink.obj"
	-@erase "$(INTDIR)\HTMemLog.obj"
	-@erase "$(INTDIR)\HTMethod.obj"
	-@erase "$(INTDIR)\HTNet.obj"
	-@erase "$(INTDIR)\HTNoFree.obj"
	-@erase "$(INTDIR)\HTParse.obj"
	-@erase "$(INTDIR)\HTProt.obj"
	-@erase "$(INTDIR)\HTReqMan.obj"
	-@erase "$(INTDIR)\HTResponse.obj"
	-@erase "$(INTDIR)\HTStream.obj"
	-@erase "$(INTDIR)\HTTCP.obj"
	-@erase "$(INTDIR)\HTTimer.obj"
	-@erase "$(INTDIR)\HTTrans.obj"
	-@erase "$(INTDIR)\HTUser.obj"
	-@erase "$(INTDIR)\HTUTree.obj"
	-@erase "$(INTDIR)\HTWWWStr.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwcore.dll"
	-@erase "$(OUTDIR)\Debug\wwwcore.ilk"
	-@erase "$(OUTDIR)\wwwcore.exp"
	-@erase "$(OUTDIR)\wwwcore.lib"
	-@erase "$(OUTDIR)\wwwcore.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwcore.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwcore.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwcore.pdb" /debug /machine:I386 /def:".\wwwcore.def" /out:"$(OUTDIR)\Debug\wwwcore.dll" /implib:"$(OUTDIR)\wwwcore.lib" 
DEF_FILE= \
	".\wwwcore.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAlert.obj" \
	"$(INTDIR)\HTAnchor.obj" \
	"$(INTDIR)\HTChannl.obj" \
	"$(INTDIR)\HTDNS.obj" \
	"$(INTDIR)\HTError.obj" \
	"$(INTDIR)\HTEscape.obj" \
	"$(INTDIR)\HTEvent.obj" \
	"$(INTDIR)\HTFormat.obj" \
	"$(INTDIR)\HTHost.obj" \
	"$(INTDIR)\HTInet.obj" \
	"$(INTDIR)\HTLib.obj" \
	"$(INTDIR)\HTLink.obj" \
	"$(INTDIR)\HTMemLog.obj" \
	"$(INTDIR)\HTMethod.obj" \
	"$(INTDIR)\HTNet.obj" \
	"$(INTDIR)\HTNoFree.obj" \
	"$(INTDIR)\HTParse.obj" \
	"$(INTDIR)\HTProt.obj" \
	"$(INTDIR)\HTReqMan.obj" \
	"$(INTDIR)\HTResponse.obj" \
	"$(INTDIR)\HTStream.obj" \
	"$(INTDIR)\HTTCP.obj" \
	"$(INTDIR)\HTTimer.obj" \
	"$(INTDIR)\HTTrans.obj" \
	"$(INTDIR)\HTUser.obj" \
	"$(INTDIR)\HTUTree.obj" \
	"$(INTDIR)\HTWWWStr.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Debug\wwwcore.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("wwwcore.dep")
!INCLUDE "wwwcore.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwcore.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwcore - Win32 Release" || "$(CFG)" == "wwwcore - Win32 Debug"
SOURCE=..\HTAlert.c

"$(INTDIR)\HTAlert.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTAnchor.c

"$(INTDIR)\HTAnchor.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTChannl.c

"$(INTDIR)\HTChannl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTDNS.c

"$(INTDIR)\HTDNS.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTError.c

"$(INTDIR)\HTError.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTEscape.c

"$(INTDIR)\HTEscape.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTEvent.c

"$(INTDIR)\HTEvent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTFormat.c

"$(INTDIR)\HTFormat.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTHost.c

"$(INTDIR)\HTHost.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTInet.c

"$(INTDIR)\HTInet.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTLib.c

"$(INTDIR)\HTLib.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTLink.c

"$(INTDIR)\HTLink.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMemLog.c

"$(INTDIR)\HTMemLog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMethod.c

"$(INTDIR)\HTMethod.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTNet.c

"$(INTDIR)\HTNet.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTNoFree.c

"$(INTDIR)\HTNoFree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTParse.c

"$(INTDIR)\HTParse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTProt.c

"$(INTDIR)\HTProt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTReqMan.c

"$(INTDIR)\HTReqMan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTResponse.c

"$(INTDIR)\HTResponse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTStream.c

"$(INTDIR)\HTStream.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTCP.c

"$(INTDIR)\HTTCP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTimer.c

"$(INTDIR)\HTTimer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTrans.c

"$(INTDIR)\HTTrans.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTUser.c

"$(INTDIR)\HTUser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTUTree.c

"$(INTDIR)\HTUTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTWWWStr.c

"$(INTDIR)\HTWWWStr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwcore - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwcore - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwcore - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwcore - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

