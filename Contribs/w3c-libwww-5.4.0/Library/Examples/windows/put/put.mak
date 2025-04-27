# Microsoft Developer Studio Generated NMAKE File, Based on put.dsp
!IF "$(CFG)" == ""
CFG=put - Win32 Debug
!MESSAGE No configuration specified. Defaulting to put - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "put - Win32 Release" && "$(CFG)" != "put - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "put.mak" CFG="put - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "put - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "put - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "put - Win32 Release"

OUTDIR=.\..\..\..\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\put.exe"

!ELSE 

ALL : "wwwinit - Win32 Release" "$(OUTDIR)\put.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\put.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\put.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\put.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\put.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\put.pdb" /machine:I386 /out:"$(OUTDIR)\put.exe" 
LINK32_OBJS= \
	"$(INTDIR)\put.obj" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\put.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "put - Win32 Debug"

OUTDIR=.\..\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\put.exe"

!ELSE 

ALL : "wwwinit - Win32 Debug" "$(OUTDIR)\put.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\put.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\put.exe"
	-@erase "$(OUTDIR)\put.ilk"
	-@erase "$(OUTDIR)\put.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\put.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\put.pdb" /debug /machine:I386 /out:"$(OUTDIR)\put.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\put.obj" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\put.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("put.dep")
!INCLUDE "put.dep"
!ELSE 
!MESSAGE Warning: cannot find "put.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "put - Win32 Release" || "$(CFG)" == "put - Win32 Debug"
SOURCE=..\..\put.c

"$(INTDIR)\put.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!IF  "$(CFG)" == "put - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\Examples\windows\put"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\put"

!ELSEIF  "$(CFG)" == "put - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\Examples\windows\put"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\put"

!ENDIF 


!ENDIF 

