# Microsoft Developer Studio Generated NMAKE File, Based on chunk.dsp
!IF "$(CFG)" == ""
CFG=chunk - Win32 Debug
!MESSAGE No configuration specified. Defaulting to chunk - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "chunk - Win32 Release" && "$(CFG)" != "chunk - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "chunk.mak" CFG="chunk - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "chunk - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "chunk - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "chunk - Win32 Release"

OUTDIR=.\..\..\..\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\chunk.exe"

!ELSE 

ALL : "wwwinit - Win32 Release" "$(OUTDIR)\chunk.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\chunk.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\chunk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\chunk.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\chunk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\chunk.pdb" /machine:I386 /out:"$(OUTDIR)\chunk.exe" 
LINK32_OBJS= \
	"$(INTDIR)\chunk.obj" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\chunk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "chunk - Win32 Debug"

OUTDIR=.\..\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\chunk.exe"

!ELSE 

ALL : "wwwinit - Win32 Debug" "$(OUTDIR)\chunk.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\chunk.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\chunk.exe"
	-@erase "$(OUTDIR)\chunk.ilk"
	-@erase "$(OUTDIR)\chunk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\chunk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\chunk.pdb" /debug /machine:I386 /out:"$(OUTDIR)\chunk.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\chunk.obj" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\chunk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("chunk.dep")
!INCLUDE "chunk.dep"
!ELSE 
!MESSAGE Warning: cannot find "chunk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "chunk - Win32 Release" || "$(CFG)" == "chunk - Win32 Debug"
SOURCE=..\..\chunk.c

"$(INTDIR)\chunk.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!IF  "$(CFG)" == "chunk - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\Examples\windows\chunk"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\chunk"

!ELSEIF  "$(CFG)" == "chunk - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\Examples\windows\chunk"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\chunk"

!ENDIF 


!ENDIF 

