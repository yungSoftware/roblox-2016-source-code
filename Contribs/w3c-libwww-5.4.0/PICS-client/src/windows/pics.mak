# Microsoft Developer Studio Generated NMAKE File, Based on pics.dsp
!IF "$(CFG)" == ""
CFG=pics - Win32 Release
!MESSAGE No configuration specified. Defaulting to pics - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "pics - Win32 Release" && "$(CFG)" != "pics - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "pics.mak" CFG="pics - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "pics - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "pics - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "pics - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\pics.dll"

!ELSE 

ALL : "wwwmime - Win32 Release" "wwwfile - Win32 Release" "wwwapp - Win32 Release" "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\pics.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwapp - Win32 ReleaseCLEAN" "wwwfile - Win32 ReleaseCLEAN" "wwwmime - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CSApp.obj"
	-@erase "$(INTDIR)\CSChkLab.obj"
	-@erase "$(INTDIR)\CSKwik.obj"
	-@erase "$(INTDIR)\CSLabel.obj"
	-@erase "$(INTDIR)\CSLLOut.obj"
	-@erase "$(INTDIR)\CSLLURLs.obj"
	-@erase "$(INTDIR)\CSMacRed.obj"
	-@erase "$(INTDIR)\CSMem.obj"
	-@erase "$(INTDIR)\CSParse.obj"
	-@erase "$(INTDIR)\CSStream.obj"
	-@erase "$(INTDIR)\CSUser.obj"
	-@erase "$(INTDIR)\CSUsrLst.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\pics.exp"
	-@erase "$(OUTDIR)\pics.lib"
	-@erase "$(OUTDIR)\Release\pics.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\Library\src" /I "..\..\..\Library\External" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\pics.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\pics.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\pics.pdb" /machine:I386 /def:".\pics.def" /out:"$(OUTDIR)\Release\pics.dll" /implib:"$(OUTDIR)\pics.lib" 
DEF_FILE= \
	".\pics.def"
LINK32_OBJS= \
	"$(INTDIR)\CSApp.obj" \
	"$(INTDIR)\CSChkLab.obj" \
	"$(INTDIR)\CSKwik.obj" \
	"$(INTDIR)\CSLabel.obj" \
	"$(INTDIR)\CSLLOut.obj" \
	"$(INTDIR)\CSLLURLs.obj" \
	"$(INTDIR)\CSMacRed.obj" \
	"$(INTDIR)\CSMem.obj" \
	"$(INTDIR)\CSParse.obj" \
	"$(INTDIR)\CSStream.obj" \
	"$(INTDIR)\CSUser.obj" \
	"$(INTDIR)\CSUsrLst.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwapp.lib" \
	"$(OUTDIR)\wwwfile.lib" \
	"$(OUTDIR)\wwwmime.lib"

"$(OUTDIR)\Release\pics.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

OUTDIR=.\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\pics.dll"

!ELSE 

ALL : "wwwmime - Win32 Debug" "wwwfile - Win32 Debug" "wwwapp - Win32 Debug" "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\pics.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwapp - Win32 DebugCLEAN" "wwwfile - Win32 DebugCLEAN" "wwwmime - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CSApp.obj"
	-@erase "$(INTDIR)\CSChkLab.obj"
	-@erase "$(INTDIR)\CSKwik.obj"
	-@erase "$(INTDIR)\CSLabel.obj"
	-@erase "$(INTDIR)\CSLLOut.obj"
	-@erase "$(INTDIR)\CSLLURLs.obj"
	-@erase "$(INTDIR)\CSMacRed.obj"
	-@erase "$(INTDIR)\CSMem.obj"
	-@erase "$(INTDIR)\CSParse.obj"
	-@erase "$(INTDIR)\CSStream.obj"
	-@erase "$(INTDIR)\CSUser.obj"
	-@erase "$(INTDIR)\CSUsrLst.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\pics.dll"
	-@erase "$(OUTDIR)\pics.exp"
	-@erase "$(OUTDIR)\pics.ilk"
	-@erase "$(OUTDIR)\pics.lib"
	-@erase "$(OUTDIR)\pics.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\Library\src" /I "..\..\..\Library\External" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\pics.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\pics.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\pics.pdb" /debug /machine:I386 /def:".\pics.def" /out:"$(OUTDIR)\pics.dll" /implib:"$(OUTDIR)\pics.lib" 
DEF_FILE= \
	".\pics.def"
LINK32_OBJS= \
	"$(INTDIR)\CSApp.obj" \
	"$(INTDIR)\CSChkLab.obj" \
	"$(INTDIR)\CSKwik.obj" \
	"$(INTDIR)\CSLabel.obj" \
	"$(INTDIR)\CSLLOut.obj" \
	"$(INTDIR)\CSLLURLs.obj" \
	"$(INTDIR)\CSMacRed.obj" \
	"$(INTDIR)\CSMem.obj" \
	"$(INTDIR)\CSParse.obj" \
	"$(INTDIR)\CSStream.obj" \
	"$(INTDIR)\CSUser.obj" \
	"$(INTDIR)\CSUsrLst.obj" \
	"..\..\..\Bin\wwwcore.lib" \
	"..\..\..\Bin\wwwdll.lib" \
	"..\..\..\Bin\wwwutils.lib" \
	"..\..\..\Bin\wwwapp.lib" \
	"..\..\..\Bin\wwwfile.lib" \
	"..\..\..\Bin\wwwmime.lib"

"$(OUTDIR)\pics.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("pics.dep")
!INCLUDE "pics.dep"
!ELSE 
!MESSAGE Warning: cannot find "pics.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "pics - Win32 Release" || "$(CFG)" == "pics - Win32 Debug"
SOURCE=..\CSApp.c

"$(INTDIR)\CSApp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSChkLab.c

"$(INTDIR)\CSChkLab.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSKwik.c

"$(INTDIR)\CSKwik.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSLabel.c

"$(INTDIR)\CSLabel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSLLOut.c

"$(INTDIR)\CSLLOut.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSLLURLs.c

"$(INTDIR)\CSLLURLs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSMacRed.c

"$(INTDIR)\CSMacRed.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSMem.c

"$(INTDIR)\CSMem.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSParse.c

"$(INTDIR)\CSParse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSStream.c

"$(INTDIR)\CSStream.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSUser.c

"$(INTDIR)\CSUser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\CSUsrLst.c

"$(INTDIR)\CSUsrLst.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!IF  "$(CFG)" == "pics - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwcore - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 

!IF  "$(CFG)" == "pics - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwdll - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 

!IF  "$(CFG)" == "pics - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwutils - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 

!IF  "$(CFG)" == "pics - Win32 Release"

"wwwapp - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwapp - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwapp - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwapp - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 

!IF  "$(CFG)" == "pics - Win32 Release"

"wwwfile - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwfile - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwfile - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwfile - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 

!IF  "$(CFG)" == "pics - Win32 Release"

"wwwmime - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" 
   cd "..\..\..\PICS-client\src\windows"

"wwwmime - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ELSEIF  "$(CFG)" == "pics - Win32 Debug"

"wwwmime - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" 
   cd "..\..\..\PICS-client\src\windows"

"wwwmime - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\PICS-client\src\windows"

!ENDIF 


!ENDIF 

