# Microsoft Developer Studio Generated NMAKE File, Based on wwwfile.dsp
!IF "$(CFG)" == ""
CFG=wwwfile - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwfile - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwfile - Win32 Release" && "$(CFG)" != "wwwfile - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwfile.mak" CFG="wwwfile - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwfile - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwfile - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwfile - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwfile\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwfile.dll"

!ELSE 

ALL : "wwwtrans - Win32 Release" "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwfile.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwtrans - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTBind.obj"
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTFile.obj"
	-@erase "$(INTDIR)\HTMulti.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwfile.dll"
	-@erase "$(OUTDIR)\wwwfile.exp"
	-@erase "$(OUTDIR)\wwwfile.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwfile.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwfile.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwfile.pdb" /machine:I386 /def:".\wwwfile.def" /out:"$(OUTDIR)\Release\wwwfile.dll" /implib:"$(OUTDIR)\wwwfile.lib" 
DEF_FILE= \
	".\wwwfile.def"
LINK32_OBJS= \
	"$(INTDIR)\HTBind.obj" \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTFile.obj" \
	"$(INTDIR)\HTMulti.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwtrans.lib"

"$(OUTDIR)\Release\wwwfile.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwfile - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwfile\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwfile.dll"

!ELSE 

ALL : "wwwtrans - Win32 Debug" "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwfile.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwtrans - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTBind.obj"
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTFile.obj"
	-@erase "$(INTDIR)\HTMulti.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwfile.dll"
	-@erase "$(OUTDIR)\Debug\wwwfile.ilk"
	-@erase "$(OUTDIR)\wwwfile.exp"
	-@erase "$(OUTDIR)\wwwfile.lib"
	-@erase "$(OUTDIR)\wwwfile.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwfile.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwfile.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwfile.pdb" /debug /machine:I386 /def:".\wwwfile.def" /out:"$(OUTDIR)\Debug\wwwfile.dll" /implib:"$(OUTDIR)\wwwfile.lib" 
DEF_FILE= \
	".\wwwfile.def"
LINK32_OBJS= \
	"$(INTDIR)\HTBind.obj" \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTFile.obj" \
	"$(INTDIR)\HTMulti.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwtrans.lib"

"$(OUTDIR)\Debug\wwwfile.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwfile.dep")
!INCLUDE "wwwfile.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwfile.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwfile - Win32 Release" || "$(CFG)" == "wwwfile - Win32 Debug"
SOURCE=..\HTBind.c

"$(INTDIR)\HTBind.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTBInit.c

"$(INTDIR)\HTBInit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTFile.c

"$(INTDIR)\HTFile.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMulti.c

"$(INTDIR)\HTMulti.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwfile - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwfile - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwfile - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwfile - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwfile - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwfile - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwfile - Win32 Release"

"wwwtrans - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Release" 
   cd "."

"wwwtrans - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwfile - Win32 Debug"

"wwwtrans - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Debug" 
   cd "."

"wwwtrans - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

