# Microsoft Developer Studio Generated NMAKE File, Based on wwwxml.dsp
!IF "$(CFG)" == ""
CFG=wwwxml - Win32 Debug
!MESSAGE No configuration specified. Defaulting to wwwxml - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wwwxml - Win32 Release" && "$(CFG)" != "wwwxml - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwxml.mak" CFG="wwwxml - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwxml - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwxml - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwxml - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwxml\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwxml.dll"

!ELSE 

ALL : "wwwhtml - Win32 Release" "wwwutils - Win32 Release" "wwwstream - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwxml.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwstream - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwhtml - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTRDF.obj"
	-@erase "$(INTDIR)\HTXML.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwxml.dll"
	-@erase "$(OUTDIR)\wwwxml.exp"
	-@erase "$(OUTDIR)\wwwxml.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwxml.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwxml.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwxml.pdb" /machine:I386 /def:".\wwwxml.def" /out:"$(OUTDIR)\Release\wwwxml.dll" /implib:"$(OUTDIR)\wwwxml.lib" 
DEF_FILE= \
	".\wwwxml.def"
LINK32_OBJS= \
	"$(INTDIR)\HTRDF.obj" \
	"$(INTDIR)\HTXML.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\xmlparse.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwhtml.lib"

"$(OUTDIR)\Release\wwwxml.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwxml\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwxml.dll"

!ELSE 

ALL : "wwwhtml - Win32 Debug" "wwwutils - Win32 Debug" "wwwstream - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwxml.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwstream - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwhtml - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTRDF.obj"
	-@erase "$(INTDIR)\HTXML.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwxml.dll"
	-@erase "$(OUTDIR)\Debug\wwwxml.ilk"
	-@erase "$(OUTDIR)\wwwxml.exp"
	-@erase "$(OUTDIR)\wwwxml.lib"
	-@erase "$(OUTDIR)\wwwxml.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwxml.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwxml.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwxml.pdb" /debug /machine:I386 /def:".\wwwxml.def" /out:"$(OUTDIR)\Debug\wwwxml.dll" /implib:"$(OUTDIR)\wwwxml.lib" 
DEF_FILE= \
	".\wwwxml.def"
LINK32_OBJS= \
	"$(INTDIR)\HTRDF.obj" \
	"$(INTDIR)\HTXML.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\xmlparse.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwhtml.lib"

"$(OUTDIR)\Debug\wwwxml.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwxml.dep")
!INCLUDE "wwwxml.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwxml.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwxml - Win32 Release" || "$(CFG)" == "wwwxml - Win32 Debug"
SOURCE=..\HTRDF.c

"$(INTDIR)\HTRDF.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTXML.c

"$(INTDIR)\HTXML.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwxml - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwxml - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwxml - Win32 Release"

"wwwstream - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" 
   cd "."

"wwwstream - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

"wwwstream - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" 
   cd "."

"wwwstream - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwxml - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwxml - Win32 Release"

"wwwhtml - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" 
   cd "."

"wwwhtml - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwxml - Win32 Debug"

"wwwhtml - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" 
   cd "."

"wwwhtml - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

