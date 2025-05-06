# Microsoft Developer Studio Generated NMAKE File, Based on wwwapp.dsp
!IF "$(CFG)" == ""
CFG=wwwapp - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwapp - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwapp - Win32 Release" && "$(CFG)" != "wwwapp - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwapp.mak" CFG="wwwapp - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwapp - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwapp - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwapp - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwapp\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwapp.dll"

!ELSE 

ALL : "wwwhttp - Win32 Release" "wwwfile - Win32 Release" "wwwstream - Win32 Release" "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwapp.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwstream - Win32 ReleaseCLEAN" "wwwfile - Win32 ReleaseCLEAN" "wwwhttp - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAccess.obj"
	-@erase "$(INTDIR)\HTDialog.obj"
	-@erase "$(INTDIR)\HTEvtLst.obj"
	-@erase "$(INTDIR)\HTFilter.obj"
	-@erase "$(INTDIR)\HTHist.obj"
	-@erase "$(INTDIR)\HTHome.obj"
	-@erase "$(INTDIR)\HTLog.obj"
	-@erase "$(INTDIR)\HTProxy.obj"
	-@erase "$(INTDIR)\HTRules.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwapp.dll"
	-@erase "$(OUTDIR)\wwwapp.exp"
	-@erase "$(OUTDIR)\wwwapp.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwapp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwapp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwapp.pdb" /machine:I386 /def:".\wwwapp.def" /out:"$(OUTDIR)\Release\wwwapp.dll" /implib:"$(OUTDIR)\wwwapp.lib" 
DEF_FILE= \
	".\wwwapp.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAccess.obj" \
	"$(INTDIR)\HTDialog.obj" \
	"$(INTDIR)\HTEvtLst.obj" \
	"$(INTDIR)\HTFilter.obj" \
	"$(INTDIR)\HTHist.obj" \
	"$(INTDIR)\HTHome.obj" \
	"$(INTDIR)\HTLog.obj" \
	"$(INTDIR)\HTProxy.obj" \
	"$(INTDIR)\HTRules.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\gnu_regex.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwfile.lib" \
	"$(OUTDIR)\wwwhttp.lib"

"$(OUTDIR)\Release\wwwapp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwapp\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwapp.dll"

!ELSE 

ALL : "wwwhttp - Win32 Debug" "wwwfile - Win32 Debug" "wwwstream - Win32 Debug" "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwapp.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwstream - Win32 DebugCLEAN" "wwwfile - Win32 DebugCLEAN" "wwwhttp - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAccess.obj"
	-@erase "$(INTDIR)\HTDialog.obj"
	-@erase "$(INTDIR)\HTEvtLst.obj"
	-@erase "$(INTDIR)\HTFilter.obj"
	-@erase "$(INTDIR)\HTHist.obj"
	-@erase "$(INTDIR)\HTHome.obj"
	-@erase "$(INTDIR)\HTLog.obj"
	-@erase "$(INTDIR)\HTProxy.obj"
	-@erase "$(INTDIR)\HTRules.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwapp.dll"
	-@erase "$(OUTDIR)\Debug\wwwapp.ilk"
	-@erase "$(OUTDIR)\wwwapp.exp"
	-@erase "$(OUTDIR)\wwwapp.lib"
	-@erase "$(OUTDIR)\wwwapp.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwapp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwapp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=WSock32.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwapp.pdb" /debug /machine:I386 /def:".\wwwapp.def" /out:"$(OUTDIR)\Debug\wwwapp.dll" /implib:"$(OUTDIR)\wwwapp.lib" 
DEF_FILE= \
	".\wwwapp.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAccess.obj" \
	"$(INTDIR)\HTDialog.obj" \
	"$(INTDIR)\HTEvtLst.obj" \
	"$(INTDIR)\HTFilter.obj" \
	"$(INTDIR)\HTHist.obj" \
	"$(INTDIR)\HTHome.obj" \
	"$(INTDIR)\HTLog.obj" \
	"$(INTDIR)\HTProxy.obj" \
	"$(INTDIR)\HTRules.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\gnu_regex.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwfile.lib" \
	"$(OUTDIR)\wwwhttp.lib"

"$(OUTDIR)\Debug\wwwapp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwapp.dep")
!INCLUDE "wwwapp.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwapp.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwapp - Win32 Release" || "$(CFG)" == "wwwapp - Win32 Debug"
SOURCE=..\HTAccess.c

"$(INTDIR)\HTAccess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTDialog.c

"$(INTDIR)\HTDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTEvtLst.c

"$(INTDIR)\HTEvtLst.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTFilter.c

"$(INTDIR)\HTFilter.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTHist.c

"$(INTDIR)\HTHist.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTHome.c

"$(INTDIR)\HTHome.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTLog.c

"$(INTDIR)\HTLog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTProxy.c

"$(INTDIR)\HTProxy.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTRules.c

"$(INTDIR)\HTRules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwstream - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" 
   cd "."

"wwwstream - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwstream - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" 
   cd "."

"wwwstream - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwfile - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" 
   cd "."

"wwwfile - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwfile - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" 
   cd "."

"wwwfile - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwapp - Win32 Release"

"wwwhttp - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" 
   cd "."

"wwwhttp - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwapp - Win32 Debug"

"wwwhttp - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" 
   cd "."

"wwwhttp - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

