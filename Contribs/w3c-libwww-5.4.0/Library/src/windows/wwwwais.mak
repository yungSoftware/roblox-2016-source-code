# Microsoft Developer Studio Generated NMAKE File, Based on wwwwais.dsp
!IF "$(CFG)" == ""
CFG=wwwwais - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwwais - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwwais - Win32 Release" && "$(CFG)" != "wwwwais - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwwais.mak" CFG="wwwwais - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwwais - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwwais - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwwais - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwwais\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwwais.dll"

!ELSE 

ALL : "wwwapp - Win32 Release" "wwwhtml - Win32 Release" "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwwais.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwhtml - Win32 ReleaseCLEAN" "wwwapp - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTWAIS.obj"
	-@erase "$(INTDIR)\HTWSRC.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwwais.dll"
	-@erase "$(OUTDIR)\wwwwais.exp"
	-@erase "$(OUTDIR)\wwwwais.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwwais.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwwais.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwwais.pdb" /machine:I386 /def:".\wwwwais.def" /out:"$(OUTDIR)\Release\wwwwais.dll" /implib:"$(OUTDIR)\wwwwais.lib" 
DEF_FILE= \
	".\wwwwais.def"
LINK32_OBJS= \
	"$(INTDIR)\HTWAIS.obj" \
	"$(INTDIR)\HTWSRC.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwapp.lib"

"$(OUTDIR)\Release\wwwwais.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwwais\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwwais.dll"

!ELSE 

ALL : "wwwapp - Win32 Debug" "wwwhtml - Win32 Debug" "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwwais.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwhtml - Win32 DebugCLEAN" "wwwapp - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTWAIS.obj"
	-@erase "$(INTDIR)\HTWSRC.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwwais.dll"
	-@erase "$(OUTDIR)\Debug\wwwwais.ilk"
	-@erase "$(OUTDIR)\wwwwais.exp"
	-@erase "$(OUTDIR)\wwwwais.lib"
	-@erase "$(OUTDIR)\wwwwais.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwwais.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwwais.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwwais.pdb" /debug /machine:I386 /def:".\wwwwais.def" /out:"$(OUTDIR)\Debug\wwwwais.dll" /implib:"$(OUTDIR)\wwwwais.lib" 
DEF_FILE= \
	".\wwwwais.def"
LINK32_OBJS= \
	"$(INTDIR)\HTWAIS.obj" \
	"$(INTDIR)\HTWSRC.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwapp.lib"

"$(OUTDIR)\Debug\wwwwais.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwwais.dep")
!INCLUDE "wwwwais.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwwais.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwwais - Win32 Release" || "$(CFG)" == "wwwwais - Win32 Debug"
SOURCE=..\HTWAIS.c

"$(INTDIR)\HTWAIS.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTWSRC.c

"$(INTDIR)\HTWSRC.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwwais - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwwais - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwwais - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwwais - Win32 Release"

"wwwhtml - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" 
   cd "."

"wwwhtml - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

"wwwhtml - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" 
   cd "."

"wwwhtml - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwwais - Win32 Release"

"wwwapp - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" 
   cd "."

"wwwapp - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwwais - Win32 Debug"

"wwwapp - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" 
   cd "."

"wwwapp - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

