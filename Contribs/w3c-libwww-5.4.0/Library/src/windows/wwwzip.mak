# Microsoft Developer Studio Generated NMAKE File, Based on wwwzip.dsp
!IF "$(CFG)" == ""
CFG=wwwzip - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwzip - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwzip - Win32 Release" && "$(CFG)" != "wwwzip - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwzip.mak" CFG="wwwzip - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwzip - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwzip - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwzip - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwzip\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwzip.dll"

!ELSE 

ALL : "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwzip.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTZip.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Release\wwwzip.dll"
	-@erase "$(OUTDIR)\wwwzip.exp"
	-@erase "$(OUTDIR)\wwwzip.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwzip.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwzip.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwzip.pdb" /machine:I386 /def:".\wwwzip.def" /out:"$(OUTDIR)\Release\wwwzip.dll" /implib:"$(OUTDIR)\wwwzip.lib" 
DEF_FILE= \
	".\wwwzip.def"
LINK32_OBJS= \
	"$(INTDIR)\HTZip.obj" \
	"..\..\External\zlib.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Release\wwwzip.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwzip - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwzip\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwzip.dll"

!ELSE 

ALL : "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwzip.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTZip.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Debug\wwwzip.dll"
	-@erase "$(OUTDIR)\Debug\wwwzip.ilk"
	-@erase "$(OUTDIR)\wwwzip.exp"
	-@erase "$(OUTDIR)\wwwzip.lib"
	-@erase "$(OUTDIR)\wwwzip.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwzip.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwzip.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwzip.pdb" /debug /machine:I386 /def:".\wwwzip.def" /out:"$(OUTDIR)\Debug\wwwzip.dll" /implib:"$(OUTDIR)\wwwzip.lib" 
DEF_FILE= \
	".\wwwzip.def"
LINK32_OBJS= \
	"$(INTDIR)\HTZip.obj" \
	"..\..\External\zlib.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)\Debug\wwwzip.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwzip.dep")
!INCLUDE "wwwzip.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwzip.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwzip - Win32 Release" || "$(CFG)" == "wwwzip - Win32 Debug"
SOURCE=..\HTZip.c

"$(INTDIR)\HTZip.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!IF  "$(CFG)" == "wwwzip - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwzip - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwzip - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwzip - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwzip - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwzip - Win32 Debug"

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

