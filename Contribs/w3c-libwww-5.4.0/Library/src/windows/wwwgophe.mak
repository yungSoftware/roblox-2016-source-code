# Microsoft Developer Studio Generated NMAKE File, Based on wwwgophe.dsp
!IF "$(CFG)" == ""
CFG=wwwgophe - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwgophe - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwgophe - Win32 Release" && "$(CFG)" != "wwwgophe - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwgophe.mak" CFG="wwwgophe - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwgophe - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwgophe - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwgophe - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwgophe\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwgophe.dll"

!ELSE 

ALL : "wwwutils - Win32 Release" "wwwhtml - Win32 Release" "wwwdll - Win32 Release" "wwwdir - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwgophe.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdir - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwhtml - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTGopher.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwgophe.dll"
	-@erase "$(OUTDIR)\wwwgophe.exp"
	-@erase "$(OUTDIR)\wwwgophe.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwgophe.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwgophe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwgophe.pdb" /machine:I386 /def:".\wwwgophe.def" /out:"$(OUTDIR)\Release\wwwgophe.dll" /implib:"$(OUTDIR)\wwwgophe.lib" 
DEF_FILE= \
	".\wwwgophe.def"
LINK32_OBJS= \
	"$(INTDIR)\HTGopher.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdir.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Release\wwwgophe.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwgophe\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwgophe.dll"

!ELSE 

ALL : "wwwutils - Win32 Debug" "wwwhtml - Win32 Debug" "wwwdll - Win32 Debug" "wwwdir - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwgophe.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdir - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwhtml - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTGopher.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwgophe.dll"
	-@erase "$(OUTDIR)\Debug\wwwgophe.ilk"
	-@erase "$(OUTDIR)\wwwgophe.exp"
	-@erase "$(OUTDIR)\wwwgophe.lib"
	-@erase "$(OUTDIR)\wwwgophe.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwgophe.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwgophe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwgophe.pdb" /debug /machine:I386 /def:".\wwwgophe.def" /out:"$(OUTDIR)\Debug\wwwgophe.dll" /implib:"$(OUTDIR)\wwwgophe.lib" 
DEF_FILE= \
	".\wwwgophe.def"
LINK32_OBJS= \
	"$(INTDIR)\HTGopher.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdir.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Debug\wwwgophe.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwgophe.dep")
!INCLUDE "wwwgophe.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwgophe.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwgophe - Win32 Release" || "$(CFG)" == "wwwgophe - Win32 Debug"
SOURCE=..\HTGopher.c

"$(INTDIR)\HTGopher.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwgophe - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwgophe - Win32 Release"

"wwwdir - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Release" 
   cd "."

"wwwdir - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

"wwwdir - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Debug" 
   cd "."

"wwwdir - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwgophe - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwgophe - Win32 Release"

"wwwhtml - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" 
   cd "."

"wwwhtml - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

"wwwhtml - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" 
   cd "."

"wwwhtml - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwgophe - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwgophe - Win32 Debug"

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

