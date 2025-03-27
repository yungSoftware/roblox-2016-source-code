# Microsoft Developer Studio Generated NMAKE File, Based on wwwdll.dsp
!IF "$(CFG)" == ""
CFG=wwwdll - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwdll - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwdll - Win32 Release" && "$(CFG)" != "wwwdll - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwdll.mak" CFG="wwwdll - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwdll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwdll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwdll - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwdll\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

ALL : "$(OUTDIR)\Release\wwwdll.dll"


CLEAN :
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(INTDIR)\wwwdll.obj"
	-@erase "$(OUTDIR)\Release\wwwdll.dll"
	-@erase "$(OUTDIR)\wwwdll.exp"
	-@erase "$(OUTDIR)\wwwdll.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwdll.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwdll.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwdll.pdb" /machine:I386 /def:".\wwwdll.def" /out:"$(OUTDIR)\Release\wwwdll.dll" /implib:"$(OUTDIR)\wwwdll.lib" 
DEF_FILE= \
	".\wwwdll.def"
LINK32_OBJS= \
	"$(INTDIR)\windll.obj" \
	"$(INTDIR)\wwwdll.obj"

"$(OUTDIR)\Release\wwwdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwdll - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwdll\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

ALL : "$(OUTDIR)\Debug\wwwdll.dll"


CLEAN :
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(INTDIR)\wwwdll.obj"
	-@erase "$(OUTDIR)\Debug\wwwdll.dll"
	-@erase "$(OUTDIR)\Debug\wwwdll.ilk"
	-@erase "$(OUTDIR)\wwwdll.exp"
	-@erase "$(OUTDIR)\wwwdll.lib"
	-@erase "$(OUTDIR)\wwwdll.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwdll.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwdll.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwdll.pdb" /debug /machine:I386 /def:".\wwwdll.def" /out:"$(OUTDIR)\Debug\wwwdll.dll" /implib:"$(OUTDIR)\wwwdll.lib" 
DEF_FILE= \
	".\wwwdll.def"
LINK32_OBJS= \
	"$(INTDIR)\windll.obj" \
	"$(INTDIR)\wwwdll.obj"

"$(OUTDIR)\Debug\wwwdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwdll.dep")
!INCLUDE "wwwdll.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwdll.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwdll - Win32 Release" || "$(CFG)" == "wwwdll - Win32 Debug"
SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\wwwdll.c

"$(INTDIR)\wwwdll.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

